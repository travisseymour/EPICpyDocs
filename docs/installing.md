# Installing EPICpy

## Tested Platforms

Installation of EPICpy has only been successfully tested on the platforms listed below:

Linux Variants:

- [x] Debian-based Linux variants (e.g., Ubuntu, Mint, PopOS, etc.)
- [ ] Redhat-based Linux variants (e.g., Redhat, Fedora, Centos, etc.)
- [ ] Arch-based Linux variants (e.g., ArchLinux, Manjaro, EndeavourOS, etc.)

Linux Versions:

- [x] 18.04 "Bionic"
- [x] 20.04 LTS "Focal"
- [x] 22.04 LTS "Jammy"

MacOS Versions:

- [x] 10.15 "Catalina" (Intel)
- [ ] 11 "Big Sur" (Intel)
- [ ] 12 "Monteray" (Intel)
- [ ] 12 "Monteray" (M1)
- [ ] 13 "Ventura" 

Windows Versions:

- [x] 10
- [ ] 11

If your goal is to use EPICpy to a) run EPIC simulations, b) create or edit device files, c) create and edit perceptual encoder files, or c) create or run rule files, then there is no need to set up and configure the entire EPICpy development environment. All you need to do is install EPICpy using PipX and download the demo task-device package.

## Installation Overview

#### Necessary Python Versions

To install EPICpy, you need:

1. A supported version of Python installed on your computer. For Linux and MacOS, that's Python 3.10. For Windows, that's Python 3.9. These versions do not have to be the default version of Python on your system, they just need to be installed somewhere so PipX can use that Python install to create a virtual environment. If you need to install one of these versions, please see the [Installing Python With PyEnv section](installing_python_with_pyenv.md)
2. PipX installed on your computer

#### Obtaining Package Managers

On Linux, PipX can be installed using the built-in package installer. However, on MacOS and Windows, package managers 
have to be installed manually. On MacOS, we recommend Homebrew. On Windows, we recommend Chocolatey. Other package 
managers should work as well, as long as you can use them to install PipX. To learn how to install a package manager 
on MacOS or Windows, go to the [Installing Package Managers section]

#### Python Install Location

Unless your default Python (i.e., what runs when you type `python3`) is Python 3.10 on Linux and MacOS or Python 3.9 on 
Windows, you will have to supply the path to the appropriate Python version when you use PipX to install EPICpy. On 
Linux and MacOS, you can probably find out the answer to this question by using this command:

```bash
which python3
# OR
which python3.10
```

but it _could_ still miss something, depending on how exactly you installed Python 3.

On Windows, this is no easy feat at all. 

If you have the necessary version of Python as your system Python, then you're already ready to install.
Otherwise, if you already know the path to the necessary version of Python, then you're ready to install.
For everyone else, I recommend installing PyEnv [https://github.com/pyenv/pyenv](https://github.com/pyenv/pyenv). PyEnv will allow you to install any
 number of Python versions each in isolated folders under a unified directory. It's easy to add or delete Python 
independently and without fear of altering your system copy of Python. If you do not Python 3.10 on MacOS and Linux, or 
you're on Windows and you don't have Python 3.9, or you have the necessary version of Python but don't know _where_ it 
is on your computer, then please follow the instructions in the [Installing Python With PyEnv section](installing_python_with_pyenv.md) for installing 
PyEnv and obtaining the location of any PyEnv-installed version of Python.

#### NOTE on Older Linux Versions

NOTE: For those running older versions of Linux, EPICpy may not run if your have an older version of GLIBC.
To determine where you stand, run this command:

```bash
ldd --version
```

If that returns a version of GLIBC version >= 2.32, then EPICpy will probably work on your system. Otherwise, it is 
likely that it will not work.

<hr>

## Installing EPICpy With PipX

### Linux

#### Installing PipX

Install PipX onto your system using your package manager. All Linux variants come with a standard package manager, e.g.,
 `apt` on Debian-based distributions, `yum` on RedHat-based distributions, and `pacman` on Arch-based distributions. 
NOTE: I have only tested this on Debian systems, but theoretically, it should be universal.

```bash
# recommended approach
sudo apt install pipx
# later, if you want to update PipX, use:
sudo apt upgrade pipx # will get run automatically with other system updates
```

OR, an alternative approach would be

```bash
# alternate approach
python3 -m pip install --user pipx
# later, if you want to update PipX, use:
python3 -m pip install --user --upgrade pipx
```

This is an important step. It resets the terminal shell...alternatively you could just close and reopen the terminal

```bash
exec $SHELL
```

Make sure any installed apps will be on your path (otherwise, it will be challenging to use them after installation).

```bash   
pipx ensurepath
```

Basic PipX use

```bash
pipx list
pipx install [PackageName|LocalPackageDirectory|PackageURL]
pipx uninstall [PackageName]
pipx upgrade [PackageName]
```

#### Checking Prerequisites

Currently, EPICpy for Linux requires that you have Python 3.10.x installed on your computer. 
If you do not, please do that first. It doesn't matter where it is installed, or how you install it.
One source is to grab an official installer from the Python Software Foundation (https://www.python.org). 
Another is to install it using PyEnv (https://github.com/pyenv/pyenv). Then again, your system Python might already have Python 3.10 installed. Try this:

```bash
python3 --version
```

if it reports Python 3.10.x, then your system Python is probably version 3.10. Great! 

Otherwise, you can ask Linux if it can find Python 3.10 anywhere:

```bash
which python3.10
```

if this returns a path, copy it and set it aside. This is the location of Python 3.10 on your machine.

If neither of those returns good news, then you will need to install Python 3.10 in order to proceed. Afterward, either 
note where you installed Python 3.10, or try running `which python3.10` again. I recommend installing Pyenv. For 
instructions, see the [Installing Python With PyEnv section](installing_python_with_pyenv.md).

#### Installing EPICpy with PipX

If you have Python 3.10.x somewhere on your computer, and you are running a recent-ish version of Linux, 
and you have PipX installed, then you are ready to install EPICpy!

If your system Python version is 3.10.x (i.e., running `python3 --version` returns 3.10.x), then you can simply run this 
command

```bash
pipx install https://github.com/travisseymour/EPICpy
```

If Python 3.10.x is on your system somewhere, but not necessarily the default Python, then you will need to tell PipX 
the location of Python 3.10.x on your computer. How you achieve that, depends on your setup.

If you can start Python 3.10.x by typing `python3.10`, then you can install EPICpy as such:

```bash
pipx install https://github.com/travisseymour/EPICpy --python python3.10
```

otherwise, you will need to supply the complete path to Python 3.10.x on your machine:

```bash
# the Python path used here is for example purposes only, 
# use one that makes sense on your computer
pipx install https://github.com/travisseymour/EPICpy --python /home/testuser/.pyenv/shims/python3.10
```

This process may take a few minutes, please be patient. 

NOTE: If you like seeing stuff happen, add the `--verbose` flag, e.g.:

```bash
pipx install --verbose https://github.com/travisseymour/EPICpy --python python3.10
```

<hr/>

### MacOS

#### Installing PipX with Homebrew

Because MacOS does not have a default package manager, I'm assuming that you have installed the Homebrew package manager. If not, see the [Installing A Package Manager section](installing_a_package_manager.md). If you are using an alternative 
MacOS package manager, then adjust the commands below accordingly.


Install PipX onto your system using Homebrew, issue this command:

```bash
brew install pipx
# later, if you want to update PipX, use:
brew upgrade pipx
```

This is an important step. It resets the terminal shell...alternatively you could just close and reopen the terminal

```bash
exec $SHELL
```

Make sure any installed apps will be on your path (otherwise, it will be challenging to use them after installation).

```bash   
pipx ensurepath
```

Basic PipX use

```bash
pipx list
pipx install [PackageName|LocalPackageDirectory|PackageURL]
pipx uninstall [PackageName]
pipx upgrade [PackageName]
```

#### Checking Prerequisites

Currently, EPICpy for MacOS requires that you have Python 3.10.x installed on your computer. 
If you do not, please do that first. It doesn't matter where it is installed, or how you install it.
One source is to grab an official installer from the Python Software Foundation (https://www.python.org). 
Another is to install it using PyEnv (https://github.com/pyenv/pyenv). 
Then again, your system Python might already have Python 3.10 installed. Try this:

```bash
python3 --version
```

if it reports Python 3.10.x, then your system Python is probably version 3.10. Great! 

Otherwise, you can ask MacOS if it can find Python 3.10 anywhere:

```bash
which python3.10
```

if this returns a path, copy it and set it aside. This is the location of Python 3.10 on your machine.

If neither of those returns good news, then you will need to install Python 3.10 in order to proceed. Afterward, either 
note where you installed Python 3.10, or try running `which python3.10` again. I recommend installing Pyenv. For 
instructions, see the [Installing Python With PyEnv section](installing_python_with_pyenv.md).


#### Installing EPICpy with PipX

If you have Python 3.10.x somewhere on your computer, and you are running a version Catalina or later of MacOS, 
then you are ready to install EPICpy!

If your system Python version is 3.10.x (i.e., running `python3 --version` returns 3.10.x), then you can simply run this 
command

```bash
pipx install https://github.com/travisseymour/EPICpy
```

If Python 3.10.x is on your system somewhere, but not necessarily the default Python, then you will need to tell PipX 
the location of Python 3.10.x on your computer. How you achieve that, depends on your setup.

If you can start Python 3.10.x by typing `python3.10`, then you can install EPICpy as such:

```bash
pipx install https://github.com/travisseymour/EPICpy --python python3.10
```

otherwise, you will need to supply the complete path to Python 3.10.x on your machine:

```bash
# the Python path used here is for example purposes only, 
# use one that makes sense on your python setup
pipx install https://github.com/travisseymour/EPICpy --python /home/testuser/.pyenv/shims/python3.10
```

This process may take a few minutes, please be patient. If you like seeing stuff happen, add the --verbose flag, e.g.:

```bash
pipx install --verbose https://github.com/travisseymour/EPICpy --python python3.10
```

<hr/>

### Windows

#### Installing PipX with Chocolatey

To install PipX onto your system using the Chocolatey package manager, issue the following command. If you do not have 
Chocolatey installed, see the [Installing A Package Manager section](installing_a_package_manager.md):

```bash
choco install pipx
```

Close and reopen the PowerShell in administer mode.

Now make sure any installed apps will be on your path (otherwise, it will be challenging to use them after installation).

```bash   
pipx ensurepath
```

Basic PipX use

```bash
pipx list
pipx install [PackageName|LocalPackageDirectory|PackageURL]
pipx uninstall [PackageName]
pipx upgrade [PackageName]
```

#### Checking Prerequisites

Currently, EPICpy for Windows requires that you have Python 3.9.x installed on your computer. 
If you do not, please do that first. It doesn't matter where it is installed, or how you install it.
One source is to grab an official installer from the Python Software Foundation (https://www.python.org). 
Another is to install it using PyEnv (https://github.com/pyenv/pyenv). Then again, your system Python might already 
have Python 3.10 installed. Try this:

```bash
python3 --version
```

if it reports Python 3.9.x, then your system Python is probably version 3.10. Great! 

Otherwise, even if you have Python3.9 installed _somewhere_, it can be difficult to locate it on Windows (if anyone has
 an easy way to locate a specific version of Python on Windows, please let me know!). Thus, I recommend either 
installing Python 3.9 using an installer from python.org (because you will have to _choose_ the installation location), or 
installing Python 3.9 using PyEnv. I recommend installing Pyenv. For 
instructions, see the [Installing Python With PyEnv section](installing_python_with_pyenv.md).


#### Installing EPICpy with PipX

If you have Python 3.9.x somewhere on your computer, and you know the path, then you are ready to install EPICpy!

If your system Python version is 3.9.x (i.e., running `python3 --version` returns 3.9.x), then you can simply run this 
command

```bash
pipx install https://github.com/travisseymour/EPICpy
```

If Python 3.9.x is on your system somewhere, but not necessarily the default Python, then you will need to tell PipX 
the location of Python 3.9.x on your computer. How you achieve that, depends on your setup.

If you can start Python 3.9.x by typing `python39`, then you can install EPICpy as such:

```bash
pipx install https://github.com/travisseymour/EPICpy --python python39
```

otherwise, you will need to supply the complete path to Python 3.9.x on your machine:

```bash
# the Python paths used here are for example purposes only, 
# use a path that makes sense for your python setup
pipx install https://github.com/travisseymour/EPICpy --python "C:\Users\testuser\AppData\Local\Programs\Python\Python39\python.exe"
pipx install https://github.com/travisseymour/EPICpy --python "C:\Users\testuser\.pyenv\pyenv-win\versions\3.9.13\python.exe"
```

This process may take a few minutes, please be patient. If you like seeing stuff happen, add the --verbose flag, e.g.:

```bash
pipx install --verbose https://github.com/travisseymour/EPICpy --python python39
```

### Check your EPICpy install

To run EPICpy, just open a terminal and type `EPICpy`, this should open several windows associated with the EPICpy 
application. In the menu, navigate to **Help->Tests->Standard_Run**. This should cause a test run of the demo 
choice-task device. If it completes and shows a colorful results graph, then all is well.
