- Install:
    - à travers un script sh (deploy)
    - installation de brew pour macOS
    - installation des programmes divers en fonction de l'OS:
        - macOS: git coreutils zsh neovim tmux fzf ag
        - ubuntu: zsh, neovim, tmux, git, ag, fzf
    OK - création des répertoires divers
        OK - ceux pour la configuration
        OK - $HOME/Workspace
    OK - lien vers la configuration en fonction de l'OS (macOS ou Linux)
    - proposer d'installer (yes/no):
        - node (nvm)
        - nginx
    - création d'une clef ssh
    - installation des fonts, notamment pour powerline
- neovim:
    OK - configuration actuelle
    OK - trouver un moyen de faire un :PlugInstall
    - ameliorer l'autocompletion
- tmux:
    OK - mettre à jour la configuration pour un truc plus stylé (voir simonsmith/dotfiles)
    OK - faire un répertoire pour les profils divers
- git:
    OK - configuration actuelle
- zsh:
    OK - prompt: utiliser spaceship
    OK - plus d'alias compatible entre chaque OS
    OK - revoir l'autocompletion
    OK - utiliser exa à la place de ls
    OK - utiliser bat à la place de cat

A INSTALLER
    - brew update && brew install git coreutils zsh neovim tmux fzf ag exa bat
      openssl python3 nvm
    - spaceship
    - python3 -m pip install --user --upgrade pynvim
    - nvm i -g
        - neovim
    - gem install
        - neovim
    - rust: rustc racer
