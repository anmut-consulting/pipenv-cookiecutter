#!/usr/bin/env sh
(
    printf "\n-> installing xcode: \n\n"
    if ! [[ -x $(xcode-select -p) ]];
    then 
        xcode-select -s /Applications/Xcode.app/Contents/Developer \
        || (xcodebuild -licence \
            && xcode-select -s /Applications/Xcode.app/Contents/Developer) \
        && xcodebuild -license
    fi
    printf "\n-> xcode installed <-\n\n"

    printf "\n-> installing xcode cli: \n\n"
    xcode-select --install \
    && printf "\n-> xcode cli installed <-\n\n" \
    || printf "\n"
    printf "\n-> installing homebrew: \n\n"
    {
        if ! [[ $(brew --version) ]];
        then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi \
        && printf "\n-> homebrew installed <-\n\n" \
        && printf "\n-> installing from brew:\n" \
        && printf "     zsh python3 cmake git htop openssl readline sqlite3 tree unar xz zlib pipx pyenv\n\n" \
        && {
          brew install zsh
          brew install python3
          brew install cmake
          brew install git
          brew install htop
          brew install openblas
          brew install libjpeg
          brew install openssl
          brew install readline
          brew install mysql
          brew install sqlite3
          brew install postgres
          brew install tree
          brew install unar
          brew install xz
          brew install zlib
          brew install zmq
          brew install pipx
          brew install pyenv
          brew install watch
#          brew tap heroku/brew && brew install heroku
        }
    } \
    && printf "\n-> packages installed from brew! <-\n\n"
    touch ~/.zshrc
    if ! grep -Fxq 'export PYENV_ROOT="$HOME/.pyenv"' ~/.zshrc
    then
        printf 'export PYENV_ROOT="$HOME/.pyenv"\n' >> ~/.zshrc
    fi
    if ! grep -Fxq 'export PATH="$PYENV_ROOT:$PATH"' ~/.zshrc
    then
        printf 'export PATH="$PYENV_ROOT:$PATH"\n' >> ~/.zshrc
    fi
    if ! grep -Fxq 'if command -v pyenv 1>/dev/null 2>&1; then' ~/.zshrc
    then
        printf 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi\n' >> ~/.zshrc
    fi
    source ~/.zshrc
    printf "\n-> installing software from homebrew casks:\n"
    printf "this is a minimal list to get you started\n"
    {
        brew install --cask docker
        brew install --cask dbeaver-community
        brew install --cask sublime-text
        brew install --cask the-unarchiver
        brew install --cask drawio
        pipx ensurepath && source ~/.zshrc
    } && printf "\n-> installation from homebrew casks successfully <-\n\n"
    printf "Adding compiler flags for bzip2\n"
    if ! grep -Fxq 'export LDFLAGS=-L/usr/local/opt/bzip2/lib' ~/.zshrc
    then
        printf "export LDFLAGS=-L/usr/local/opt/bzip2/lib\n" >> ~/.zshrc
    fi
    if ! grep -Fxq 'export CPPFLAGS=-I/usr/local/opt/bzip2/include' ~/.zshrc
        then
    printf "export CPPFLAGS=-I/usr/local/opt/bzip2/include\n" >> ~/.zshrc
    fi
    printf "\n-> installing from pipx:\n"
    printf "   pipenv pipenv-pipes pre-commit\n"
    {
        pipx install pipenv
        pipx install pipenv-pipes
        pipx install pre-commit
    } && printf "finished installing python tools\n"
    source ~/.zshrc
    printf "\n-> pipx installations complete <-\n" \
    && printf "\n-> configuring git to run pre-commit hooks, when found, automatically:\n" \
    && git config --global init.templateDir ~/.git-template \
    && pre-commit init-templatedir ~/.git-template -t pre-commit -t pre-push \
    && printf "\n-> pre-commit configured <-\n" ) \
&& (
    printf "\n\n"
    printf "================== INSTALLATION COMPLETE! ==================\n"
    printf "CLOSE ALL TERMINAL WINDOWS AND REOPEN TO ENSURE CORRECT PATH\n"
    printf "================== INSTALLATION COMPLETE! ==================\n"
    printf "\n\n" ) && printf 'tell application "Terminal" to close (every window)\n' && exit 0 || exit 1