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

NOTE: There are so many ways to install Python on various operating systems, not to mention multiple ways to install PipX, that it would get cumbersome to try and capture them all in these instructions. Thus, the instructions below give a single way to install EPICpy on each operating system without breaking any other Python installation that your system may be using.

#### Necessary Python Versions

To install EPICpy, you need:

1. A supported version of Python installed on your computer. For Linux and MacOS, that's Python 3.10. For Windows, that's Python 3.9. These versions do not have to be the default version of Python on your system, they just need to be installed in a known location. 
2. PipX installed. PipX can be installed either using a package manager

#### Obtaining Package Managers

On Linux, PipX can be installed using the built-in package installer. MacOS doesn't come with a package manager, so we will have to install one. At the moment, installing PipX on windows using the preferred package manager isn't working, so we will use Python itself to install PipX on Windows.

#### NOTE on Older Linux Versions

NOTE: For those running older versions of Linux, EPICpy may not run if your have an older version of GLIBC.
To determine where you stand, run this command:

```bash
ldd --version
```

If that returns a version of GLIBC version >= 2.32, then EPICpy will probably work on your system. Otherwise, it is 
likely that it will not work.

<hr>

## Installing A Package Manager

⇨ MacOS users, follow the instructions in the [Installing a Package Manager](installing_a_package_manager.md) section before continuing.

## Installing Python Using PyEnv

Regardless of which operating system you are using and whether you already have a suitable version of Python installed, we strongly recommend installing PyEnv and using PyEnv to install the appropriate version of Python. This way, the version of Python you are using for EPICpy will be separate from other versions and won't inadvertently break anything in your operating system.

⇨ Go to the [Installing Python with PyEnv](installing_python_with_pyenv.md) section and install Python now.

## Installing EPICpy With PipX

### Linux

#### Installing PipX

Install PipX onto your system using your package manager. All Linux variants come with a standard package manager, e.g.,
 `apt` on Debian-based distributions, `yum` on RedHat-based distributions, and `pacman` on Arch-based distributions. 
NOTE: I have only tested this on Debian systems, but theoretically, it should be universal.

```bash
# recommended approach
sudo apt install pipx
```

Now, close and reopen your terminal <-- **Do Not Skip This Step!**

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

#### Installing EPICpy with PipX

I'm assuming you followed the instructions in the [Installing Python with PyEnv](installing_python_with_pyenv.md) section already. If not do so now.

Generally, the command for installing a program with PipX is as follows:

pipx install **[PATH TO SOURCE FILES]** --python **[PATH TO THE VERSION OF PYTHON TO USE WITH THE APPLIATION]**

e.g., if your username was "testuser" and you used PyEnv to install Python 3.10.11, the something like this should work:

```bash
pipx install 'git+https://github.com/travisseymour/EPICpy.git' --python /home/testuser/.pyenv/versions/3.10.11/bin/python3
```

This process may take a few minutes, please be patient. 

NOTE: If you like seeing stuff happen while you wait, then add the `--verbose` flag, e.g.:

```bash
pipx install --verbose 'git+https://github.com/travisseymour/EPICpy.git' --python /home/testuser/.pyenv/versions/3.10.11/bin/python3
```

<hr/>

### MacOS

#### Installing PipX

The instructions below assume you have installed the Homebrew package manager on your machine. If not, go to the [Installing a Package Manager](installing_a_package_manager.md) section and do so now.

Once you have installed Homebrew, you can install PipX using this command:

```bash
# recommended approach
brew install pipx
```

Now, close and reopen your terminal <-- **Do Not Skip This Step!**

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

#### Installing EPICpy with PipX

I'm assuming you followed the instructions in the [Installing Python with PyEnv](installing_python_with_pyenv.md) section already. If not do so now.

Generally, the command for installing a program with PipX is as follows:

pipx install **[PATH TO SOURCE FILES]** --python **[PATH TO THE VERSION OF PYTHON TO USE WITH THE APPLIATION]**

e.g., if your username was "testuser" and you used PyEnv to install Python 3.10.11, the something like this should work:

```bash
pipx install 'git+https://github.com/travisseymour/EPICpy.git' --python /Users/testuser/.pyenv/versions/3.10.11/bin/python3
```

This process may take a few minutes, please be patient. 

NOTE: If you like seeing stuff happen while you wait, then add the `--verbose` flag, e.g.:

```bash
pipx install --verbose 'git+https://github.com/travisseymour/EPICpy.git' --python /Users/testuser/.pyenv/versions/3.10.11/bin/python3
```

<hr/>

### Windows

Note: The following was tested in PowrShell in Administer mode

#### Installing PipX

I'm assuming you followed the instructions in the [Installing Python with PyEnv](installing_python_with_pyenv.md) section already. If not do so now.

Once you have installed Homebrew, you can install PipX using this command:

(assuming your username is "testuser" and you installed Python 3.9.13)
```bash
C:\Users\testuser\.pyenv\pyenv-win\versions\3.9.13\python3.exe -m pip install pipx
```

Now, close and reopen your terminal <-- **Do Not Skip This Step!**

Make sure any installed apps will be on your path (otherwise, it will be challenging to use them after installation).

```bash   
C:\Users\testuser\.pyenv\pyenv-win\versions\3.9.13\python3.exe -m pipx ensurepath
```

Basic PipX use

```bash
# NOTE: Replace "python3" below with the full path to the version of
# Python you used to install PipX. 
# E.g., C:\Users\testuser\.pyenv\pyenv-win\versions\3.9.13\python3.exe
pipx list
pipx install [PackageName|LocalPackageDirectory|PackageURL]
pipx uninstall [PackageName]
pipx upgrade [PackageName]
```

#### Installing EPICpy with PipX

I'm assuming you followed the instructions in the [Installing Python with PyEnv](installing_python_with_pyenv.md) section already. If not do so now.

Generally, the command for installing a program with PipX is as follows:

pipx install **[PATH TO SOURCE FILES]** --python **[PATH TO THE VERSION OF PYTHON TO USE WITH THE APPLIATION]**

e.g., if your username was "testuser" and you used PyEnv to install Python 3.10.11, the something like this should work:

```bash
C:\Users\testuser\.pyenv\pyenv-win\versions\3.9.13\python3.exe -m pipx install 'git+https://github.com/travisseymour/EPICpy.git' --python C:\Users\testuser\.pyenv\pyenv-win\versions\3.9.13\python3.exe
```

This process may take a few minutes, please be patient. 

NOTE: If you like seeing stuff happen while you wait, then add the `--verbose` flag, e.g.:

```bash
C:\Users\testuser\.pyenv\pyenv-win\versions\3.9.13\python3.exe -m pipx --verbose install 'git+https://github.com/travisseymour/EPICpy.git' --python C:\Users\testuser\.pyenv\pyenv-win\versions\3.9.13\python3.exe
```

<hr/>

### Check your EPICpy install

To run EPICpy, just open a terminal and type `EPICpy`, this should open several windows associated with the EPICpy 
application. In the menu, navigate to **Help->Tests->Standard_Run**. This should cause a test run of the demo 
choice-task device. If it completes and shows a colorful results graph, then all is well.
