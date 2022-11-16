# Setting up the basics on OS X

If you have not installed the basics yet, here is a guide to set yourself up for success.
This guide will be focussing on zsh, as this is now the default shell that ships with OS X.
If you are still using bash, change all references to `zsh` to the appropriate version for bash, i.e. `~/.zshrc` becomes `~/.bashrc`.

If you prefer just running a script without going through all the steps manually, see the [basics.sh](./basics.sh) script.  You may need to run `chmod +x basics.sh` to be able to run it ( `./basics.sh` ).

## First things first: xcode
In order to set your machine up for python development, you will need to have xcode installed.

Start by pressing the `command` and `spacebar` keys simultaneously to open spotlight search,
type `terminal` in the window and press `enter`.
In the new terminal window, type the following:
```zsh
xcode-select -p
```
If you receive the following output, then Xcode is installed:

```output
/Library/Developer/CommandLineTools
```

If you received an error, then in your web browser install Xcode from the App Store and accept the default options.

Once Xcode is installed, return to your Terminal window. 
Next, you’ll need to install Xcode’s separate Command Line Tools app, which you can do by typing:
```zsh
xcode-select --install
```
At this point, Xcode and its Command Line Tools app are fully installed, 
and we are ready to install the package manager Homebrew.


## Installing Homebrew: brew
To install Homebrew, type this into your Terminal window:
```zsh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Once the installation process is complete, we’ll put the Homebrew directory at the top of the `PATH` environment variable. 
This will ensure that Homebrew installations will be called over the tools that 
Mac OS X may select automatically that could run counter to the development environment we’re creating.

```zsh
echo 'if ! [[ :$PATH: == *:"/usr/local/bin":* ]] ; then export PATH=/usr/local/bin:$PATH ; fi' >> ~/.zshrc
exit
```
> *now close your terminal window and open a new one before continuing*

To make sure that everything went smoothly (or if you ever need to troubleshoot things in the future) run:
```zsh
brew doctor
```
Follow the instructions (if any) from that output.  If everything is set up perfectly there will be no action points suggested by homebrew.


## Install a few important things with homebrew (brew)

#### Install the newest version of zsh
to get all the shiny new things
```zsh
brew install zsh
```

#### Install a non-system version of python3
to ensure we don't mess up our whole system later on
```zsh
brew install python3
```
If everything went according to plan, running `which python3` should yield `/usr/local/bin/python3`

#### Install a few miscellaneous things that will come in handy:
```zsh
brew install git htop openssl readline sqlite3 xz zlib
```

#### Install pyenv
a tool for simple Python version management (i.e. 3.6.10, 3.7.6, 3.8.1, etc)
```zsh
brew install pyenv
```
**important:** *unless you want to have endless troubles with pyenv, make sure you do the following:*
```zsh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
exit
```
> *now close your terminal window and open a new one before continuing*

#### Install pipx
a tool to help you install and run end-user applications written in Python
```zsh
brew install pipx
pipx ensurepath
exit
```
> *now close your terminal window and open a new one before continuing*

## Install another few things with pipx
#### Install pipenv
the official Python-recommended resource for managing package dependencies.
```zsh
pipx install pipenv
```

#### Install pipenv bolt-on functions
pipenv-pipes helps you to activate pipenv environments, automatically change to the environment working directory.
From anywhere, simply type `pipes` to see your environments, select one and enter.
```zsh
pipx install pipenv-pipes
```

#### Set up pre-commit and pre-push hooks
To keep code nice and clean and avoid spending time on non-syntactic formatting differences 
when reviewing code [git hooks](https://git-scm.com/docs/githooks) come in very handy.  
To set up your git to automatically install pre-commit and pre-push hooks when present in the repo, 
[see this guide](https://pre-commit.com/#automatically-enabling-pre-commit-on-repositories)
```
pipx install pre-commit
git config --global init.templateDir ~/.git-template
pre-commit init-templatedir ~/.git-template -t pre-commit -t pre-push
exit
```
> *now close your terminal window and open a new one before continuing*

### Final step
Close your terminal window (in fact, close all your terminal windows and quit terminal) and then relaunch terminal.

## Done!
If you followed all of the steps above to the tee - well done! Give yourself a pat on the back and rest assured that things ought to work as expected.  If I've missed anything in this guide and you're still having trouble, please let me know by [creating a ticket](https://github.com/anmut-consulting/pipenv-cookiecutter/issues/new).
