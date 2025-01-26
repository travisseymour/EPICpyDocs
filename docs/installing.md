# Installing EPICpy (and epiccoder rule editor)

### <font color="blue">**Operating System Requirements**</font>

Although we have not tested widely, the following setups should work:

- Windows 10 and Windows 11
- MacOS Monteray and later (Intel and ARM based chips)
- Linux with Ubuntu based distros version 20.10 and later

Linux versions earlier than 20.10 _could_ work, but `ldd --version` would have to print some version >= 2.32, and you might end up having to install several other libraries.

### <font color="blue">**Installing Prerequisites**</font>

Installing these applications requires the following utilities to be installed on your computer:

- curl
- git
- uv
- Python 3.10 (MacOS and Linux) or Python 3.9 (Windows)

**Installing `curl`** 

`curl` is installed by default on MacOS and Windows. Some Linux distributions come with `curl`, and others (especially "minimal" distributions) may not.

If this check reports that `curl` is not installed:

```bash
curl --version
```

then you can install curl with your package manager, e.g.:

```bash
sudo apt install curl
```

**Installing `git`** 

`git` is not typically installed by default.

If this check reports that `git` is not installed:

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
    1. run `sudo apt install git` (replace `apt install` with whatever works on your system)

**Installing `uv`**

`uv` is not automatically installed on any operating system. 

If this check reports that `uv` is not installed:

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

**Installing `python`**

Your operating system may already have one or more version of Python installed, or it may have none.

Assuming you have `uv` installed, try this command:

```bash
uv python list --only-installed
```

Here is what I get on my Linux system:

    cpython-3.12.7-linux-x86_64-gnu   /home/user/.local/share/uv/python/cpython-3.12.7-linux-x86_64-gnu/bin/python3 -> python3.12
    cpython-3.11.10-linux-x86_64-gnu  /home/user/.local/share/uv/python/cpython-3.11.10-linux-x86_64-gnu/bin/python3 -> python3.11
    cpython-3.10.12-linux-x86_64-gnu  /usr/bin/python3.10
    cpython-3.10.12-linux-x86_64-gnu  /usr/bin/python3 -> python3.10
    cpython-3.10.12-linux-x86_64-gnu  /bin/python3.10
    cpython-3.10.12-linux-x86_64-gnu  /bin/python3 -> python3.10
    cpython-3.9.20-linux-x86_64-gnu   /home/user/.local/share/uv/python/cpython-3.9.20-linux-x86_64-gnu/bin/python3 -> python3.9

If you are running _Linux or MacOS_ and you see "3.10" anywhere in the output, then you have a version of Python (i.e., Python 3.10) that you need to install EPICpy.
If you are running _Windows_ and you see "3.9" anywhere in the output, then you have a version of Python (i.e., Python 3.10) that you need to install EPICpy.

If you don't see the version of Python you need, then it is easy to install it if you have `uv` installed:

MacOS & Linux

```bash
uv python install 3.10
```

Windows

```bash
uv python install 3.9
```

### <font color="blue">**Downloading Sample Simulations**</font>

To download the sample simulation specifications (_task devices_, associated _rules_, etc.), you can "clone" (or download) them from Prof. Seymour's UCSC git repository:

```bash
git clone https://git.ucsc.edu/nogard/mhpfiles
```

This will create a folder called `mhpfiles`. You can see what is in this folder like this:

```bash
cd mhpfiles
# Linux & MacOS
ls
# Windows
dir # ls will also work if you are using powershell
```

### <font color="blue">**Downloading EPICpy and epiccoder [EASY Approach]**</font>

I have created a python program that you can use to install `EPICpy` and `epiccoder` easily if you have `uv` installed. 

_NOTE: If you are wisely not in the habit or running random code files, feel free to inspect [tool_install.py](https://git.ucsc.edu/nogard/mhpfiles/-/blob/main/tool_install.py) before taking this next step to ensure that there are no malicious steps. If you want some assurance, consider pasting the code into a LLM and asking it what the code does (or whatever approach you'd like to do to reassure yourself)._

Simply running this command should work on MacOS, Linux, and Windows:

```bash
uv run tool_install.py
```

If it fails, it will try to tell you what prerequisite you are missing. Although it requires that you have at least installed `uv` and have _some_ version of Python installed.


To ensure that `EPICpy` correctly installed, try running it:

```bash
EPICpy
```

If you see the EPICpy graphical interface, it worked!

To ensure that `epiccoder` correctly installed, try running it:

```bash
epiccoder
```

If you see the epiccoder graphical interface, it worked!


### <font color="blue">**Downloading EPICpy and epiccoder [Manual Approach]**</font>

To install `EPICpy` and `epiccoder` manually, first make sure you have successfully installed curl, git, uv, and either Python3.9 (if you run Windows), or Python3.10 (if you run Linux or MacOs).

Next, you need to do the following:

**Obtain the path to python**

```bash
uv python list --only-installed
```

Locate one of the lines containing "3.9" (Windows) or "3.10" (MacOS & Linux). 
For example, from this:

    cpython-3.12.7-linux-x86_64-gnu   /home/nogard/.local/share/uv/python/cpython-3.12.7-linux-x86_64-gnu/bin/python3 -> python3.12
    cpython-3.11.10-linux-x86_64-gnu  /home/nogard/.local/share/uv/python/cpython-3.11.10-linux-x86_64-gnu/bin/python3 -> python3.11
    cpython-3.10.12-linux-x86_64-gnu  /usr/bin/python3.10
    cpython-3.10.12-linux-x86_64-gnu  /usr/bin/python3 -> python3.10
    cpython-3.10.12-linux-x86_64-gnu  /bin/python3.10
    cpython-3.10.12-linux-x86_64-gnu  /bin/python3 -> python3.10
    cpython-3.9.20-linux-x86_64-gnu   /home/nogard/.local/share/uv/python/cpython-3.9.20-linux-x86_64-gnu/bin/python3 -> python3.9

The structure of these entries is this:

[NAME]  [PATH]

or

[NAME]  [PATH] -> [ALIAS]

You want to copy the path. So if I choose 

`cpython-3.9.20-linux-x86_64-gnu   /home/nogard/.local/share/uv/python/cpython-3.9.20-linux-x86_64-gnu/bin/python3 -> python3.9`

I would copy just 

`/home/nogard/.local/share/uv/python/cpython-3.9.20-linux-x86_64-gnu/bin/python3`

If I choose

`cpython-3.10.12-linux-x86_64-gnu  /usr/bin/python3.10`

then I would copy just

`/usr/bin/python3.10`

**Install EPICpy**

Because `EPICpy` has specific requirements for which Python version you use on each operating system, you have to include the appropriate python path in the installation command.

Generically, the syntax would be like this:

```bash
uv tool install git+https://www.github.com/travisseymour/EPICpy.git --python [YOUR PYTHON PATH]
```

Specifically, you might enter something like this:

```bash
# Linux example
uv tool install git+https://www.github.com/travisseymour/EPICpy.git --python /usr/bin/python3.10
# MacOS example
uv tool install git+https://www.github.com/travisseymour/EPICpy.git --python .local/share/uv/python/cpython-3.10.14-macos-x86_64-none/bin/python3
# Windows example
uv tool install git+https://www.github.com/travisseymour/EPICpy.git --python AppData\Local\Programs\Python39\python.exe
```

Of course, **your** python path may be different than these examples. Use the path you copied above as a result of running `uv python list --only-installed`.


**Install epiccoder**

`epiccoder` is less picky about which Python version you use. To install it, just run this:

```bash
uv tool install git+https://www.github.com/travisseymour/epiccoder.git
```

**Testing Your Installations**


To ensure that `EPICpy` correctly installed, try running it:

```bash
EPICpy
```

If you see the EPICpy graphical interface, it worked!

To ensure that `epiccoder` correctly installed, try running it:

```bash
epiccoder
```

If you see the epiccoder graphical interface, it worked!

### <font color="blue">**Running EPIC Simulations**</font>

**IMPORTANT**: If you just installed `EPICpy` and `epiccoder`, then you have the latest version. However, if you installed EPICpy or epiccoder on your own machine during a previous session, you want to make sure you check for updates before running these tools.

```bash
uv tool upgrade EPICpy epiccoder
```

or use this script:

```bash
uv run update_tools.py
```

Now, run a simulation:

- To **start** EPICpy, just type `EPICpy` in a terminal.
- If this is your first time running `EPICpy` and the graphical interface seems wonky, then go to the menu and select `Windows🡆RestoreDefaultLayout`
- To **load** a model, you'll need to do:
    - `File🡆LoadDevice` and then locate your device file. A device file is a python file like `choice_device.py`
    - `File🡆CompileRules` and then locate your rules file. A rules file is a text file like `choicetask_rules_VM.prs`
- To **run** a model, you'll need to do:
    - `Run🡆Run`
- Try to run the Choice task simulation with the "VM" rules 3 times in a row. If you do not see the colorful graph at the end, you may not have the Stats Window open. In the menu, select `Windows🡆ShowStatsWindow`.
