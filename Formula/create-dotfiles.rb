class CreateDotfiles < Formula
  desc "Collect your dotfiles into a timestamped folder, zip or tar.gz"
  homepage "https://github.com/thilllon/create-dotfiles"
  url "https://registry.npmjs.org/create-dotfiles/-/create-dotfiles-2.3.2.tgz"
  sha256 "aad7acc14486f390b509f78d26cfe08bf3655b8edd6f8de07c920828b8bfae30"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/create-dotfiles --version")

    # `brew test` points HOME at testpath, so this is the home directory being collected.
    (testpath/".zshrc").write "export EDITOR=vim\n"
    (testpath/".ssh").mkpath
    (testpath/".ssh/config").write "Host *\n"
    (testpath/".ssh/id_ed25519").write "not a real key\n"

    output = shell_output("#{bin}/create-dotfiles --auto --format folder,zip")
    assert_match ".zshrc", output

    collections = testpath.glob("dotfiles-*").select(&:directory?)
    assert_equal 1, collections.length
    collection = collections.first
    assert_path_exists collection/".zshrc"
    assert_path_exists collection/".ssh/config"
    refute_path_exists collection/".ssh/id_ed25519"
    assert_path_exists "#{collection}.zip"

    rm testpath/".zshrc"
    shell_output("#{bin}/create-dotfiles restore #{collection}")
    assert_equal "export EDITOR=vim\n", (testpath/".zshrc").read
  end
end
