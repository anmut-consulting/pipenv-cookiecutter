#!/usr/bin/env sh
(
    echo "\n-> installing xcode: \n"
    if ! [[ -x $(xcode-select -p) ]];
    then 
        xcode-select -s /Applications/Xcode.app/Contents/Developer \
        || (xcodebuild -licence \
            && xcode-select -s /Applications/Xcode.app/Contents/Developer) \
        && xcodebuild -license
    fi
    echo "\n-> xcode installed <-\n"

    echo "\n-> installing xcode cli: \n"
    xcode-select --install \
    && echo "\n-> xcode cli installed <-\n" \
    || echo " "
    echo "\n-> installing homebrew: \n"
    {
        if ! [[ $(brew --version) ]];
        then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi \
        && echo "\n-> homebrew installed <-\n" \
        && echo "\n-> installing from brew:" \
        && echo "     zsh python3 cmake git htop openssl readline sqlite3 tree unar xz zlib pipx pyenv\n" \
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
    && echo "\n-> packages installed from brew! <-\n"
    touch ~/.zshrc
    if ! grep -Fxq 'export PYENV_ROOT="$HOME/.pyenv"' ~/.zshrc
    then
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    fi
    if ! grep -Fxq 'export PATH="$PYENV_ROOT:$PATH"' ~/.zshrc
    then
        echo 'export PATH="$PYENV_ROOT:$PATH"' >> ~/.zshrc
    fi
    if ! grep -Fxq 'if command -v pyenv 1>/dev/null 2>&1; then' ~/.zshrc
    then
        echo 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
    fi
    source ~/.zshrc
    echo "\n-> installing software from homebrew casks:"
    echo "this is a minimal list to get you started"
    {
        brew install --cask docker
        brew install --cask dashlane
        brew install --cask dbeaver-community
        brew install --cask sublime-text
        brew install --cask the-unarchiver
        brew install --cask drawio
        pipx ensurepath && source ~/.zshrc
    } && echo "\n-> installation from homebrew casks successfull <-\n"
    echo "Adding compiler flags for bzip2"
    echo "export LDFLAGS=-L/usr/local/opt/bzip2/lib" >> ~/.zshrc
    echo "export CPPFLAGS=-I/usr/local/opt/bzip2/include" >> ~/.zshrc
    echo "\n-> installing from pipx:"
    echo "   pipenv pipenv-pipes pre-commit"
    {
        pipx install pipenv
        pipx install pipenv-pipes
        pipx install pre-commit
    } && echo "finished installing python tools"
    source ~/.zshrc
    echo "\n-> pipx installations complete <-" \
    && echo "\n-> configuring git to run pre-commit hooks, when found, automatically:" \
    && git config --global init.templateDir ~/.git-template \
    && pre-commit init-templatedir ~/.git-template -t pre-commit -t pre-push \
    && echo "\n-> pre-commit configured <-" ) \
&& (
    echo "\n"
    echo "================== INSTALLATION COMPLETE! =================="
    echo "CLOSE ALL TERMINAL WINDOWS AND REOPEN TO ENSURE CORRECT PATH"
    echo "================== INSTALLATION COMPLETE! =================="
    echo "\n" ) && echo 'tell application "Terminal" to close (every window)' && exit 0 || exit 1