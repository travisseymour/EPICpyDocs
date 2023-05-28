# Installing a Package Manager

## Linux

On Linux, <u>you do not need to install a package manager</u>. All Linux variants come with a standard package manager, e.g.,
 `apt` on Debian-based distributions, `yum` on RedHat-based distributions, and `pacman` on Arch-based distributions. 
All instructions on this website assume you are installing on a Debian-based system, and thus use the `apt` package 
manager in examples. However, you should be able to easily edit these calls to the appropriate versions on your version 
of Linux.

## MacOS

Homebrew (https://brew.sh/) is a package manager for MacOS. Some MacOS users already have Homebrew installed. 
To see if you already have Homebrew, just enter `brew list` on the commandline. If you get anything other than 
an error, you already have Homebrew. If you, you must install it:

To install Homebrew, open Terminal and paste this into a terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

(or if you'd feel safer grabbing it directly from the Homebrew website, go here: https://brew.sh/)

This will take a moment. When it's done, you will have a working installation of Homebrew. 

NOTE: you may be instructed to run these two commands (or something similar) in the terminal to add Homebrew to your PATH:

```bash
(echo; echo 'eval "$(/usr/local/bin/brew shellenv"') >> /Users/testuser/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
```

## Windows

Chocolatey (https://chocolatey.org/) is a package manager for Windows. Some Windows users already have Chocolatey 
installed. 
To see if you already have Chocolatey, just enter `choco list` on the commandline. If you get anything other than 
an error, you already have Chocolatey. If not, you must install it:

To install Chocolatey, open PowerShell in Administer mode, and then paste this into a terminal 

```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
```
(or if you'd feel safer grabbing it directly from the Chocolatey website, go here: https://chocolatey.org/install 
and copy it)

This will take a moment. When it's done, you will have a working installation of Chocolatey. 