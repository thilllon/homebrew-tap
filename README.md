# thilllon/tap

Homebrew formulae by [@thilllon](https://github.com/thilllon).

| Formula | Description |
| ------- | ----------- |
| [`create-dotfiles`](Formula/create-dotfiles.rb) | Collect your dotfiles into a timestamped folder, zip or tar.gz. [Source](https://github.com/thilllon/create-dotfiles) |

## Install

Tap and trust once per machine, then install by name:

```shell
brew tap thilllon/tap
brew trust thilllon/tap
brew install create-dotfiles
```

After that, `brew install create-dotfiles` and `brew upgrade create-dotfiles` work by name.
Homebrew 6 and later load formulae only from taps you trust, which is what `brew trust` is for;
`brew tap` alone is not enough. `brew install thilllon/tap/create-dotfiles` does the same in one
command, trusting just this formula.

In a `Brewfile`:

```ruby
tap "thilllon/tap", trusted: true
brew "create-dotfiles"
```

## How updates arrive

`create-dotfiles` is released to npm from its own repository, and npm is the source of truth for
its version. [`bump.yml`](.github/workflows/bump.yml) checks npm every three hours (and on manual
dispatch). When a newer version is out, it:

1. verifies the tarball's npm provenance: it must have been built by
   `thilllon/create-dotfiles/.github/workflows/release.yml` on `main`, and must match its signed
   digest;
2. rewrites `url` and `sha256` in the formula;
3. runs `brew style`, `brew audit --strict --online`, `brew install --build-from-source` and
   `brew test` on macOS and Linux;
4. commits the formula to `main` only if all of that passed.

GitHub disables scheduled workflows in a public repository after 60 days without activity. Bump
commits count as activity, so this only happens after a long gap between releases, and
create-dotfiles' release workflow checks `bump.yml` after every release. If it is not active, the
release run fails and opens an issue in create-dotfiles that mentions the owner. To recover:

```shell
gh workflow enable bump.yml -R thilllon/homebrew-tap
gh workflow run bump.yml -R thilllon/homebrew-tap
```

Nothing needs a token beyond the workflow's own `GITHUB_TOKEN`.

There are no bottles, so `brew install` builds formulae from source. For `create-dotfiles` that is
one `npm install` of a package with no runtime dependencies, and it takes seconds. Like any source
build, it needs the developer tools Homebrew already asks for: the Command Line Tools on macOS, or
a compiler toolchain on Linux (`build-essential` or equivalent).

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
