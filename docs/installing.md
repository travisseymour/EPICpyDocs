# Installing EPICpy (and epiccoder rule editor)

### <font color="blue">**Operating System Requirements**</font>

Although we have not tested widely, EPICpy seems to work as expected in the following contexts:

- Windows 10-11
- MacOS Monteray-Ventura (Both Intel and ARM based chips)
- Linux: Debian/Unbuntu based distributions version 20.04 and later
- Linux: Fedora version 42+

> Other Linux distributions will likely work properly if they are relatively recent, but only Debian/Ubuntu and Fedora is actively tested.

### <font color="blue">**Installing Prerequisites**</font>

Installing these applications requires the following utilities to be installed on your computer:

- curl
- git
- uv

#### Installing `curl` 

`curl` is installed by default on MacOS (10.3+) and Windows (10+). Most Linux distributions come with `curl`, and some (especially "minimal" distributions) may not.

If you use **Linux** and this check reports that `curl` is _not_ installed:

```bash
curl --version
```

then you can install curl with your Linux package manager, e.g.:

```bash
# replace apt if your distro uses something else, e.g., dnf on Fedora
sudo apt install curl
```

#### Installing `git` 

`git` is not typically installed by default.

If this check reports that `git` is _not_ installed:

```bash
git --version
```

then you may need to install `git`. In all most cases, you can go here: https://git-scm.com/downloads and use the installer that goes with your operating system. 

If you prefer a command-line solutions:

- MacOS:
    1. Install [homebrew](https://brew.sh/).
    2. run `brew install git`
- Windows:
    1. Install [scoop](https://scoop.sh/)
    2. run `scoop install git`
- Linux:
    1. run `sudo apt install git` on Debian/Ubuntu distributions
    2. run `sudo dnf install git` on Fedora. 
    3. ditto for the package manager on other Linux distributions 

#### Installing `uv`

`uv` is not automatically installed on any operating system. 

If this check reports that `uv` is _not_ installed:

```bash
uv --version
```

Then you can see the installation instructions for on the [uv installation webpage](https://docs.astral.sh/uv/getting-started/installation/), which currently suggests use these commands:

MacOS and Linux

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Windows

```bash
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### <font color="blue">**Downloading Sample EPICpy Simulations**</font>

To download the sample simulations (_Task Devices_, associated _rules_, etc.), you can "clone" (or download) them like this:

First open a terminal, and then change to the directory where you want the sample devices folders to live. E.g. `cd Desktop`.

Then download the Task Device collection.
```bash
git clone https://www.github.com/travisseymour/EPICpyDevices
```

This will create a folder called `EPICpyDevices`. You can see what is in this folder like this:

```bash
cd EPICpyDevices
# Linux & MacOS
ls
# Windows
#  ls will also work if you are using powershell
dir
```

### <font color="blue">Downloading EPICpy and epiccoder</font>

To install `EPICpy` and `epiccoder` manually, first make sure you have working versions of curl, git, and `uv`.


#### Install EPICpy

Open a terminal window and type this:

```bash
uv tool install git+https://www.github.com/travisseymour/EPICpy.git --python 3.13
```

The "3.13" in the command above instructs uv to use any existing version of Python 3.13 you have installed on your system, and to otherwise download and install Python 3.13 automatically. As of the moment this document was written, EPICpy only supports Python versions **3.10-3.13**. You can specify any of these versions. We will try to release versions of EPICpy compatible with new versions of Python as they are released.

> Additional Step For **Ubuntu/Debian Linux** Users:

Run this command, or EPICpy will give you and error when you first try to run the application.
```bash
sudo apt install libxcb-cursor0
```

#### Install EpicCoder

`EpicCoder` is less picky about which Python version you use. To install it, just run this:

```bash
uv tool install git+https://www.github.com/travisseymour/epiccoder.git
```

however, if you wish to specify a Python version, you can:

```bash
uv tool install git+https://www.github.com/travisseymour/epiccoder.git --python 3.13
```

**Testing Your Installations**


To ensure that `EPICpy` correctly installed, try running it:

```bash
epicpy
```

If you see the EPICpy graphical interface, it worked!

To ensure that `epiccoder` correctly installed, try running it (you may have to open a new terminal if EPICpy is still running):

```bash
epiccoder
```

If you see the epiccoder graphical interface, it worked!

### <font color="blue">**Running EPIC Simulations**</font>

**IMPORTANT**: If you just installed `EPICpy` and `epiccoder`, then you have the latest version. However, if you installed EPICpy or epiccoder on your own machine during a previous session, you want to make sure you check for updates before running these tools.

```bash
uv tool upgrade EPICpy epiccoder
```

Now, run a simulation:

- To **start** EPICpy, just type `epicpy` in a terminal.
- If this is your first time running `EPICpy` and the graphical interface seems wonky, then go to the menu and select `Windows🡆RestoreDefaultLayout`
- To **load** a model, you'll need to do:
    - `File🡆LoadDevice` and then locate your device file. A device file is a python file like `choice_device.py`
    - `File🡆CompileRules` and then locate your rules file. A rules file is a text file like `choicetask_rules_VM.prs`
- To **run** a model, you'll need to do:
    - `Run🡆Run`
- Try to run the Choice task simulation with the "VM" rules 3 times in a row. If you do not see the colorful graph at the end, you may not have the Stats Window open. In the menu, select `Windows🡆ShowStatsWindow`.
