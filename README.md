Run `./deploy` to link all the configurations.

What needs to be installed:
- zsh
- neovim
- tmux
- git
- fzf

Don't forget to use `chsh` to move from `bash` to `zsh`.

For neovim, do a `:PlugInstall` the first time.

### macOS

Install `brew` beforehand: 

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git coreutils zsh neovim tmux fzf
```

Install a `TRUECOLOUR` terminal (see https://gist.github.com/XVilka/8346728) instead of using the default terminal of macOS.