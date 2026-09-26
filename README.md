# thilllon/tap

Homebrew formulae by [@thilllon](https://github.com/thilllon).

| Formula | Description |
| ------- | ----------- |
| [`create-dotfiles`](Formula/create-dotfiles.rb) | Collect your dotfiles into a timestamped folder, zip or tar.gz. [Source](https://github.com/thilllon/create-dotfiles) |

## Install

```shell
brew install thilllon/tap/create-dotfiles
```

Homebrew only loads formulae from taps you trust. Naming the formula in full, as above, trusts
that formula for you. If you would rather `brew tap` first and use the short name, trust the tap
once:

```shell
brew tap thilllon/tap
brew trust thilllon/tap
brew install create-dotfiles
```

In a `Brewfile`:

```ruby
tap "thilllon/tap"
brew "thilllon/tap/create-dotfiles", trusted: true
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

Nothing needs a token beyond the workflow's own `GITHUB_TOKEN`. Formulae are built from source
at install time (there are no bottles); that takes a few seconds, as the package has no runtime
dependencies besides Node.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
