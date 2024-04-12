#!/usr/bin/env sh
(
    printf "\n-> installing xcode: \n\n"
    # Check if xcode configured and if not set it up on your machine
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
        # Check if brew is installed, if not, download the install script using curl
        if ! [[ $(brew --version) ]];
        then
          /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

          # if running on an Apple Silicon-based machine, we must add to PATH manually
          UNAME_MACHINE="$(/usr/bin/uname -m)"
          if [[ "${UNAME_MACHINE}" == "arm64" ]]
          then
            printf 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
          fi
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

    # Create a zshrc file if it does not exist already. If it does, touch will
    # simply update the timestamp of the file.
    #
    # The zshrc file stands for zsh run command and is a file used to customise
    # your shell environment. It contains a list of commands that are run every
    # time a new terminal window is opened.
    # Here we are adding environment variables to the file for pyenv, one of the
    # python virtual environment systems.

    # For each line to be inserted into the file, we first check if the line
    # already exists in the file using grep, and only if it's not present is it
    # added in. This prevents these env variables being added twice if this
    # script is ever re-run.
    touch ~/.zshrc

    if ! grep -Fxq 'export PYENV_ROOT="$HOME/.pyenv"' ~/.zshrc
    then
        printf 'export PYENV_ROOT="$HOME/.pyenv"\n' >> ~/.zshrc
    fi
    if ! grep -Fxq 'export PATH="$PYENV_ROOT:$PATH"' ~/.zshrc
    then
        printf 'export PATH="$PYENV_ROOT:$PATH"\n' >> ~/.zshrc
    fi

    # Insert the pyenv init command into zshrc if it does not already exist. The
    # inserted code first checks if pyenv is installed and if present will
    # configure pyenv as a shell function and enable shims and shell
    # autocompletion.
    if ! grep -Fxq 'if command -v pyenv 1>/dev/null 2>&1; then' ~/.zshrc
    then
        printf 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi\n' >> ~/.zshrc
    fi

    # Re-initialise the shell environment, loading the above shell variables
    # and running the pyenv init command
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

    # Insert compiler flags to the zshrc file only if they're not already
    # present
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

    # Re-initialise the shell environment again, reflecting the changes made
    # above.
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