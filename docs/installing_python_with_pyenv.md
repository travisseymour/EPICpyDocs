# Installing Python Using PyEnv

The easiest way to install and manage multiple versions of Python is by using PyEvn (https://github.com/pyenv/pyenv). See below for instructions on installing PyEnv and an EPICpy compatible version of Python on your system.


## Install PyEvn

To install PyEnv, use one of these commands:

### Linux:

On Linux, required prerequisites needed for PyEnv will depend heavily on what's already installed. It's likely that some or all of the following are already installed. However, for completeness, here is the full setup:

First, you need to make sure you have the standard set of build tools installed

```bash
sudo apt install build-essential
```

Next, you need several prerequisites specifically required by PyEnv:

```bash
sudo apt install libssl-dev libffi-dev libncurses5-dev zlib1g zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev make gcc curl git
```

Now you can install PyEnv:

```bash
curl https://pyenv.run | bash
```
(If you'd feel safer, you can grab this command from the pyenv-installer website: https://github.com/pyenv/pyenv-installer)

After this completes, it will ask you to copy this to the end of your shell config (e.g., on typically bash-based Linux systems, you would add this to the end of your `~/.bashrc` file):

```
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

If you use another type of shell, then there will be some equivalent way to approach this task.

Finally, type this command to reset your terminal (or just close and re-open it):

```bash
exec $SHELL
```
<hr>

### MacOS:

For MacOS, you will need the Homebrew package manager installed. If not, go to the [Installing A Package Manager](installing_a_package_manager.md) section first.

```bash
brew install pyenv
```

After this completes, it will ask you to copy this to the end of your shell config (e.g., on bash based systems, this would be `.bashrc`, on zsh based systems, this would be '.zprofile'):

```
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

Afterward, close Terminal and then restart it so that those changes can take effect. **<-- Don't forget this step!**

<hr>

### Windows

Open a PowerShell terminal window and type in this command to set the required permissions to install PyEnv:

```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
```

Now install PyEnv:

```bash
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
```
(If you'd feel safer copying the command from the website, go here: [https://github.com/pyenv-win/pyenv-win](https://github.com/pyenv-win/pyenv-win))

When that finishes, you must close and re-open PowerShell!


## Install Python Using PyEnv

```bash
# MacOS and Linux
pyenv install 3.10
# Windows
pyenv install 3.9.13
```

which will install the latest version of Python 3.10 (e.g., this is currently 3.10.11) on Linux and MacOS. If on Windows, you'd be installing the latest version of Python 3.9 (e.g., this is currently 3.9.16).

## Obtain Python Location

You can always see which versions of Python you have installed with PyEnv by typing this command

```bash
pyenv versions
```

returns something like this:

```
  3.6.9
  3.8.7
  3.9.7
  3.9.10
  3.10.11
  3.11.2
```

### on Linux and MacOS

On Linux and MacOS, the path to your PyEnv Python versions will be something like this:

/home/**USERNAME**/.pyenv/versions/**VERSION**/bin/python3

e.g., if your username is `testuser` and the version you want to run is 3.10.11, then your path would be:

```bash
/home/testusr/.pyenv/versions/3.10.11/bin/python3
```
### on Windows

On Windows, the path to your PyEnv Python versions will be something like this:

C:\Users\[**USERNAME**]\.pyenv\pyenv-win\versions\[**VERSION**]\python.exe

e.g., if your username is `testuser` and the version you want to run is 3.9.13, then your path would be:

```bash
C:\Users\testuser\.pyenv\pyenv-win\versions\3.9.13\python.exe
```

Note that you can uninstall a version of Python anytime by making a call like this:

```bash
pyenv uninstall 3.9.13
```

