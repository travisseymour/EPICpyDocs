# EPICpy Development

## Overview

EPICpy is developed using the following technologies:

**Python**

Version 3.9.7 (currently developed with 3.9.7, but should work with later versions of 3.9.x, and probably others too.)

Note: EPICpy may work fine on Python versions beyond 3.9.x, but this has not been tested. Python earlier than Python 3.8.x will definitely **not** work. The critical question for future Python compatability is whether the modules and packages EPICpy depends on will work for Python 3.10 and beyond. This notice will be updated as newer Python versions are tested and verified as working.

**Key Packages**

- [Cppyy Bindings Generator](https://cppyy.readthedocs.io/en/latest/) (cppyy): Automatically generates automatic Python bindings for existing C++ code.
- [PySide2 GUI Framework](https://wiki.qt.io/Qt_for_Python) (pyside2): Used to build the Graphical User Interface.
- [Pingouin Stats System](https://pingouin-stats.org/) (pingouin): Meta-package providing access variety of statistical and gpraphing packages.
- [FMan Build System](https://build-system.fman.io/) (fbs): Development system facilitating creating signed executable and installers for all operating systems.

Note: The internal uses of the FMan Build System (FBS) in the EPICpy codebase will work as expected if main.py is started directly (e.g., `python3 src/main/python/main.py`), however none of the standard `fbs` commands will work on any Python version beyond 3.6.x. In order to use `fbs run` (or any `fbs` command) on Python 3.9, you will need to purchase and install the paid FBS Pro edition. __FBS Pro is not required if you just plan to develop and run the EPICpy code on your computer__.

## Preparation

### Linux

`Only tested on Ubuntu variants of Linux (e.g., Ubuntu, Mint, PopOS, etc.)`

Most recent Linux distributions come with Python 3 already installed, so you probably already have Python. The following instructions will assume you want to use that version of Python. Otherwise, adjust the path of the `python -m venv venv` command or use your own method to create the virtual environment. In addition, some Linux distributions may already have the necessary development tools (e.g., c++ compiler) installed. If so, skip the pre-requisites step. If you end up with multiple 3.x versions of Python on your system, change the one `python3` command below with the specific one you want to use, e.g., `python3.9.7` when creating the venv.

**Install Prerequisites**

```bash
sudo apt-get install -y curl gitmake g++ build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libxcb-xinerama0
```

**Download and decompress files**

```bash
# note: this will create the EPICpy source folder in the directory from which you type these commands: 
git clone https://github.com/travisseymour/EPICpy
cd EPICpy
```

**Create A Virtual Environment**

NOTE: If you are a Python developer and know what you're doing, you may not need help obtaining and installing Python 3.9.7, or creating a virtual machine using this version of Python. If so, you can skip this section:


1. Installing Python 3.9.7 using [pyenv](https://github.com/pyenv/pyenv)

- Install PyEnv
    ```bash
    curl https://pyenv.run | bash
    ```
  - Add Necessary Shell Config
  - Edit your shell config file (e.g., `~/.bashrc`) and add these commands to the end:
    ```bash
    export PATH="$HOME/.pyenv/bin:$PATH"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
    ```
- Restart your shell
    ```bash
    exec $SHELL
    ```
- Test pyenv
    ```bash
    pyenv versions
    ```
  If the above gives an error (it should just say you have no versions), then completely close your terminal and then open it again. This should allow you to use the pyenv command successfully.
- Install Python 3.9.7
    ```bash
    pyenv install 3.9.7
    # if you plan to later manage EPICpy with fbs pro, then you will need to use this version instead:
    # PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.7
    ```
- On at least one Ubuntu machine pyenv complained that some required programs were not already installed on the system. If so, install the ones it asks for. In this one case, the following was sufficient...but it may not be required for everyone!:
   ```bash
   sudo apt install libssl-dev libbz2-dev libsqlite3-dev libreadline-dev libffi-dev
   ```


2. Create a Virtual Environment Using Python 3.9.7

    - Determine where you want to store your virtual environment. One possibility is to store it within the EPICpy folder itself. This is not best practice, so consider storing it somewhere else. However, if you do this, please name it "venv" so that it will be excluded by EPICpy's gitignore policy and not be included should you ever push changes back to the repository.
    - Create the virtual environment
        ```bash
        # ~/.pyenv/versions/3.9.7/bin/python3 -m venv /PATH/TO/VIRTUAL_ENVIRONMENT
        # e.g.:
        ~/.pyenv/versions/3.9.7/bin/python3 -m ~/Desktop/EPICpy/venv
        ```
    - Activate the virtual environment
        ```bash
        # source /PATH/TO/VIRTUAL_ENVIRONMENT/bin/activate
        # e.g.:
        source ~/Desktop/EPICpy/venv/bin/activate
        ```
    - Test it
        ```bash
        python -V
        ```
        This should report `Python 3.9.7`


**Install Dependencies**

First, cd into the `EPICpy` folder, then:

```bash
# update pip itself
pip install -U pip wheel

# install EPICpy requirements
pip install -r requirements.txt
# If you have an fbs pro install command, run that now. It can also be upgraded later if you purchased fbs pro (optional).
```

***Install Cppyy Dependencies**

Unfortunately, cppyy only seems to work properly on Linux if it is installed from source ([as recommended in the cppyy documents](https://cppyy.readthedocs.io/en/latest/repositories.html#building-from-source)). See that page for a full explanation, but the key steps are copied below. Note, the steps below assumes you still have the virtual environment activated.

```bash
# Create disposable folder for building cppyy
mkdir cppyy_build
cd cppyy_build

# Build cppyy-cling
git clone https://github.com/wlav/cppyy-backend.git
cd cppyy-backend/cling
python setup.py egg_info
python create_src_directory.py

# Install cppyy-cling
python -m pip install . --upgrade
cd ..

# Build cppyy-backend
git clone https://github.com/wlav/cppyy-backend.git
cd cppyy-backend/clingwrapper

# Install cppyy-backend
python -m pip install . --upgrade --no-use-pep517 --no-deps
cd ..

# Build CPyCppyy
git clone https://github.com/wlav/CPyCppyy.git
cd CPyCppyy

# Install CPyCppyy
python -m pip install . --upgrade --no-use-pep517 --no-deps
cd ..

# Build cppyy
git clone https://github.com/wlav/cppyy.git
cd cppyy

# Install cppyy
python -m pip install . --upgrade --no-deps
```

don't forget to delete the cppyy_build folder when done, e.g., ``rm -rf cppyy_build``, as it is rather large and no longer necessary.

**One-Time Setup For EPICpy (per machine)**

WARNING: Before you do this step, make sure cppyy has been successfully built and installed into your virtual environment. If not, this step will not work.

Navigate back out to the root `EPICpy` folder. From here issue this command (it is assumed that the virtual environment is still activated):

    python3 onetime_resource_setup.py 
    
**Try to run EPICpy**

From the `EPICpy` folder issue this command (it is assumed that the virtual environment is still activated):

    python3 src/main/python/main.py

If all goes well, you should be looking at the EPICpy GUI.

### MacOS

`Only tested on MacOS version 10.15 and version 11 (both using an Intel CPU)`

**Install Prerequisites**

The only prerequisite is to install XCode. See the MacOS section of [this page](installing.md) for more information about how to download and install XCode (make sure you run it at least once post install).

**Download and decompress files**

```bash
# note: this will create the EPICpy source folder in the directory from which you type these commands: 
git clone https://github.com/travisseymour/EPICpy
cd EPICpy
```

**Create A Virtual Environment**

NOTE: If you are a Python developer and know what you're doing, you may not need help obtaining and installing Python 3.9.7, or creating a virtual machine using this version of Python. If so, you can skip this section:

**Installing Python 3.9.7**

There are 2 ways covered here for installing Python 3.9.7. I recommend using PyEnv, as it is far easier to manage if you find yourself later needing to install and manage multiple python versions. However, it's entirely up to you -- both the PyEnv and the Python.org approach have been tested and work fine. Some MacOS Python developers will likely use homebrew to manage Python...this could work too, but I have not tested it with EPICpy. Obviously, you only need to use 1 of the methods below:

1. Installing Python 3.9.7 using the Python.org installer

    If your MacOS distribution does have Python 3.9 installed, and even if it happens to be 3.9.7, I would not recommend using this version. If you mess something up, you could damage your system. Instead, go to [https://www.python.org/](https://www.python.org/) and download the official Python 3.9.7 installer. Finding the relevant download page is not super obvious, so here is the direct link: [https://www.python.org/downloads/release/python-397/](https://www.python.org/downloads/release/python-397/). If you eventually end up with multiple 3.x versions of Python on your system, change any `python` or `python3` command below with the specific one you want to use, (e.g., `python3.9.7`) when creating the venv.

2. Installing Python 3.9.7 using PyEnv <font color="green">**[Recommended]**</font>

- Install PyEnv
    ```bash
    curl https://pyenv.run | bash
    ```
  - Add Necessary Shell Config
  - Edit your shell config file (e.g., `~/bashrc`) and add these commands to the end:
    ```bash
    export PATH="$HOME/.pyenv/bin:$PATH"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
    ```
- Restart your shell
    ```bash
    exec $SHELL
    ```
- Test pyenv
    ```bash
    pyenv versions
    ```
  If the above gives an error (it should just say you have no versions), then completely close your terminal and then open it again. This should allow you to use the pyenv command successfully.
- Install Python 3.9.7
    ```bash
    pyenv install 3.9.7
    # if you plan to later manage EPICpy with fbs pro, then you will need to use this version instead:
    # PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.7
   ```


3. Create a Virtual Environment Using Python 3.9.7

    - Determine where you want to store your virtual environment. One possibility is to store it within the EPICpy folder itself. This is not best practice, so consider storing it somewhere else. However, if you do this, please name it "venv" so that it will be excluded by EPICpy's gitignore policy and not be included should you ever push changes back to the repository.
    - Create the virtual environment
        ```bash
        # ~/.pyenv/versions/3.9.7/bin/python -m venv /PATH/TO/VIRTUAL_ENVIRONMENT
        # e.g.:
        ~/.pyenv/versions/3.9.7/bin/python -m ~/Desktop/EPICpy/venv
        ```
    - Activate the virtual environment
        ```bash
        # source /PATH/TO/VIRTUAL_ENVIRONMENT/bin/activate
        # e.g.:
        source ~/Desktop/EPICpy/venv/bin/activate
        ```
    - Test it
        ```bash
        python -V
        ```
        This should report `Python 3.9.7`


**Install Dependencies**

First, cd into the `EPICpy` folder, then:

```bash
# update pip itself
pip install -U pip wheel

# install EPICpy requirements
pip install -r requirements.txt
# If you have an fbs pro install command, run that now It can also be upgraded later.
```

***Install Cppyy Dependencies**
Unlike on Linux, installing Cppyy on MacOS the normal (and much easier) way appears to be working just fine. With the virtual environment activated, issue this command:
```bash
# note, if above pip-installed  you used a version of requirements.txt with cppyy uncommented, this command will just notify you that cppyy is already installed.
pip install -U cppyy
```

**One-Time Setup For EPICpy (per machine)**

WARNING: Before you do this step, make sure cppyy has been successfully installed into your virtual environment. If not, this step will not work.

Navigate back out to the root `EPICpy` folder. From here issue this command (it is assumed that the virtual environment is still activated):

    python3 onetime_resource_setup.py 
    
**Try to run EPICpy**

From the `EPICpy` folder issue this command (it is assumed that the virtual environment is still activated):

    python3 src/main/python/main.py

If all goes well, you should be looking at the EPICpy GUI.

### Windows

For the same reason there is no EPICpy installer for Windows, there is no obvious way currently to develop EPIC on Window. However, you *should* be able to enable WSL2, install Ubuntu 18.04 or later, and then use the instructions above for Linux to develop/run EPICpy.  Consider [these instructions](linux_epicpy_under_wsl2.md) to get setup. At the end of those instructions, come back to this page and then follow the instructions above for Linux.