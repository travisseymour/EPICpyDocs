# Installing EPICpy

## Platforms

EPICpy has only been successfully tested on the platforms listed below. These are also the platforms for which executable packages are available:

* Apple MacOS (tested on version 10.13-12 on Intel CPUs)
* Ubuntu variants of Linux (e.g., Ubuntu, Mint, PopOS, etc.) versions 18.x - 21.x (probably works on later versions, but <u>does not</u> work on versions earlier than 18.x)
* Windows 10 and 11 (via [WSL2](https://docs.microsoft.com/en-us/windows/wsl/about))

If your goal is to use EPICpy to a) run EPIC simulations, b) create or edit device files, c) create and edit perceptual ecoder files, or c) create or run rule files, then there is no need to set up and configure the entire EPICpy development environment. All you need to do is download the appropriate installer for your operating system and the demo task-device pacakge.

Installers for standalone EPICpy applications can be found here: [EPICpy Website](https://cogmodlab.ucsc.edu/2022/03/14/epic/)

Note that there is no Windows binary yet. For now, Windows users will have to use the Linux version via the Windows Subsystem for Linux v2 (WSL2) using these instructions: [linux_epicpy_under_wsl2](linux_epicpy_under_wsl2.md)

## Installation

### Linux

`Only tested on Ubuntu variants of Linux (e.g., Ubuntu, Mint, PopOS, etc.) versions 18.x - 21.x`

#### Install Prerequisites

```bash
sudo apt install wget unzip g++
```

#### Obtain the EPICpy files

```bash
# Make a folder to work in [OPTIONAL]
mkdir epicwork
cd epicwork

# downloads the file EPICpy.deb, the EPICpy installer
wget people.ucsc.edu/~nogard/software/epicpy/EPICpy.deb 

# downloads the file devices.zip, a set of demo EPICpy simulations
wget people.ucsc.edu/~nogard/software/epicpy/devices.zip 

# show the files in the current folder
ls
```

Installing EPICpy

```bash

# Install the application (To uninstall later, use this command: sudo dpkg -r EPICpy)
sudo dpkg -i EPICpy.deb

# Extract the devices folder
unzip devices.zip

# To run EPICpy
/opt/EPICpy/EPICpy
```

At this point, run EPICpy, load one of the devices, compile the corresponding ruleset, and then run the simulation. For example:

1. **File->Load_Device** the Choice Device (`devices/choice/choice_device.py`).
2. **file->Compile_Rules** the visual-manual choice ruleset (`devices/choice/rules/choicetask_rules_VM.prs`).
3. For a quick test, go into **Run->Settings** and set the parameter string to `10 4 Hard Draft` (should be the default). For a complete set of choice-task data (produces a nice 2-factor graph), set the parameter string to `10 4 [Easy|Hard] [P1|P2|P3|P4]`
4. Now choose **Run->Run**.

**--OR--**

For a quick run of 10 choice-task trials with a visual encoder attached and 10 choice-task trials without an encoder attached, choose **Test->Run Tests->All Runs**

<hr/>

### MacOS

`Only tested on MacOS 10.13 - 10.15 (Intel CPU)`

These are the explicit versions I have tested EPICpy with. On other variants _may_ work.

- MacOS 10.13 (High Sierra)
- MacOS 10.14 (Mojave)
- MacOS 10.15 (Catalina)
- MacOS 11 (Big Sur)
- MacOS 12 (Monteray)

Download the necessary files using the links below:

1. [EPICpy.dmg](https://people.ucsc.edu/~nogard/software/epicpy/EPICpy.dmg) (the actual EPICpy installer package)
2. [devices.zip](https://people.ucsc.edu/~nogard/software/epicpy/devices.zip) (a set of demo EPICpy devices)


To install EPICpy, first double-click `EPICpy.dmg`. You will see the EPICpy icon next to a link to the `Applications` folder. Just drag `EPICpy.app` to your Applications folder, and it will be installed (i.e., the standard MacOS install method). To uninstall later, just drag `EPICpy.app` from your `Applications` folder to the Trash.

You will need to install Apple's [XCode](https://developer.apple.com/xcode/) development environment in order to use EPICpy (it must be there, but you won't need to use it). Apple only makes it easy to install XCode if you are running the latest version of it's operating system. So if you are using the latest version (at the time of writing, that would be MacOS 12, Monteray), just head over to the App Store, search for XCode, and install it. If, on the other hand, you are running a previous version of MacOS, you will need to register for their developer program and download the version of XCode designed for your specific operating system. The website is [https://devloper.apple.com](https://devloper.apple.com). Direct links to each version of XCode can _for now_ be found here: [https://xcodereleases.com/](https://xcodereleases.com/) (I recommend the last major release compatible with your version of MacOS).

Before downloading, make sure you have sufficient hard-drive space as the file will be quite large (e.g., XCode 13.2 is 10GB). Once you've downloaded the correct version (will take some time), extract the installer and then double-click it (note, this means you will need at least double the installer size -- e.g., 20GB or more). After it has installed, open XCode once so that it can install the build tools. Once this finishes, you can close XCode, and trash the installer (free up 10GB!); you won't need to open it again for EPICpy. I have been asked whether it would suffice to just install only the Apple XCode commandline tools (1/20 the footprint of the full XCode application) -- unfortunately, this won't work. This requirement is based on what's necessary for the [cppyy](https://cppyy.readthedocs.io/en/latest/) C++/Python automatic binding library that EPICpy is built upon.

To run EPICpy, just go into the Applications folder and double-click the EPICpy icon.

At this point, run EPICpy, load one of the devices, compile the corresponding ruleset, and then run the simulation. For example:

1. **File->Load_Device** the Choice Device (`devices/choice/choice_device.py`).
2. **file->Compile_Rules** the visual-manual choice ruleset (`devices/choice/rules/choicetask_rules_VM.prs`).
3. For a quick test, go into **Run->Settings** and set the parameter string to `10 4 Hard Draft` (should be the default). For a complete set of choice-task data (produces a nice 2-factor graph), set the parameter string to `10 4 [Easy|Hard] [P1|P2|P3|P4]`
4. Now choose **Run->Run**.

**--OR--**

For a quick run of 10 choice-task trials with a visual encoder attached and 10 choice-task trials without an encoder attached, choose **Test->Run Tests->All Runs**

<hr/>

### Windows

`Never actually tested, but it *should* work under WSL2`

There is no EPIC shared-library (EPIClib) for Windows because I have yet to get EPIClib to compile in such a way that cppyy can successfully load it. Someone may figure it out at some point, allowing me to release a Windows version. For now, Windows users will have to install Windows Subsystem for Linux v2 (WSL2), and then follow the Linux instructions above for setting up development under Linux. An alternative would be to run EPICpy with Docker (see Docker section below), but this may be significantly slower on some systems than using WSL2 directly.

I would suggest first following [THESE](linux_epicpy_under_wsl2.md) instructions for getting the Linux stand-alone version of EPICpy to work under WSl2.

<hr/>

### Docker

If you *really* want to, you can run EPICpy using Docker. The easiest way to do this is to install Docker Desktop. To install Docker Desktop, just download and install it. Then you will use it from the commandline. Note that on many systems, this will be much slower than using WSL2 to directly install the Linux version on Windows. On the other hand, this approach can allow those using non-Ubuntu variants of Linux to run EPICpy (e.g., Arch, Fedora, etc.)

#### Installation on MacOS & Windows

Start by installing the official Docker Desktop application from one of these webpages:

- MacOS: Download and install this application: [Docker Desktop For MacOS](https://hub.docker.com/editions/community/docker-ce-desktop-mac/)
- Windows: Download and install this application [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)
  - Towards the end of the installation, Docker may send you to a Microsoft webpage to update a WSL2 driver. If so, install this and then restart your machine.
  - Open powershell as Administrator and type this: `wsl --set-default-version 2`

#### Installation on Linux

This is a tiny bit more involved because the Docker repository is probably not setup on your machine. To do this safely, there are a couple of extra steps. The advantage of this effort is that (unlike on Windows and MacOS), Docker will update itself automatically with your normal Linux update process.

`Note: these instructions are from here: https://docs.docker.com/engine/install/ubuntu/`

1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
```

2. Add Docker’s official GPG key:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

3. Use the following command to set up the stable repository.

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

4. Install Docker Engine

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

<hr>

#### Running on MacOS

Setup:

- Download and Install an X-Windows Server: [XQuartz](https://www.xquartz.org/) (or alternatively install the ["homebrew" package manager](https://brew.sh/) for MacOS and then install with `brew install xquartz`)
- Start XQuartz
- In XQuartz:
    - enable `Allow Connections from Network Clients` in Security Settings
- Determine your local ip address with this command: `ifconfig en0`
- Download the EPICpy dockerfile: [Dockerfile](https://people.ucsc.edu/~nogard/software/epicpy/Dockerfile.zip) listed above.

Installation:

```bash
# unzip Dockerfile
unzip Dockerfile.zip
docker build -t epicpy - < Dockerfile
```
    
Operation:

```bash
# start the XQuartz application
# now start EPICpy from within the epicpy virtual machine. You will need the ip address you printed out in the setup stage above.

xhost + YOUR_LOCAL_IP_ADDRESS
docker run -it --rm -e DISPLAY=YOUR_LOCAL_IP_ADDRESS:0 -v /tmp/.X11-unix:/tmp/.X11-unix epicpy
```
Removal:

```bash
docker rmi -f epicpy
```

#### Running on Linux

Setup:

- Download the EPICpy dockerfile: [Dockerfile](https://people.ucsc.edu/~nogard/software/epicpy/Dockerfile.zip) listed above.

Installation:

```bash
# unzip Dockerfile and useful scripts
unzip Dockerfile.zip
docker build -t epicpy - < Dockerfile
```
    
Operation:

```bash
# start EPICpy from within the epicpy virtual machine.
xhost + local:docker
docker run -it --rm --env="DISPLAY" --net=host epicpy
```

Removal:

```bash
docker rmi -f epicpy
```

#### Running on Windows <font color="red">**[EPICpy via Docker on Windows is Not Recommended, see note below]**</font>

Note that although I have successfully run EPICpy using the following instructions on Windows 10, but I don't recommend them for the following reasons:

1. The resulting application runs significantly slower than when run from with docker on MacOS or Linux. It is also much slower than just using WLS2.
2. Docker Desktop is a large app to add to your Windows startup and by default it launches its interface automatically. If you don't have other reasons to run Docker Desktop, doing so just for EPICpy is overkill.
3. The commands required to run EPICpy via Docker involves you knowing your current lan ip address...this isn't too hard to figure out, but it might change, so it's not a set it and forget it thing for many people.
4. Docker on Windows installs and uses the Windows Subsystem for Linux (WSL2) to manage the docker containers you install. Given that there is already a Linux version of EPICpy, it's far easier to just install WSL2 yourself and then run the Linux version at nearly native speed. **I strongly suggest you take this approach on Windows**. To do so, follow [these instructions](linux_epicpy_under_wsl2.md).

Still want to run EPICpy via Docker? Ok, then follow the instructions below:

Setup:

- Download and Install an X-Windows Server: [VcXsrv](https://sourceforge.net/projects/vcxsrv/)  (or alternatively install the windows [package manager "chocolately"](https://chocolatey.org/) and then issue this command: `choco install vcxsrv`)

- In VcXsrv settings:
    - all default settings are fine except 1, you have to enable `Disable access control` on the Extras tab.
    - next, save config file to Desktop or one of the other locations they suggest.
- Determine your local ip address with this command: `ifconfig en0` in windows powershell, or `ipconfig /all` in the windows command prompt. If neither of those approaches is helpful, see this [website](https://www.digitalcitizen.life/find-ip-address-windows/#ftoc-heading-1)

Installation:

`NOTE: commands below assume you're using Windows PowerShell`

```bash
# unzip Dockerfile.zip using whatever file unzip/uncompress tool you normally use
docker rm -f epicpy
Get-Content Dockerfile | docker build -t epicpy -
```
    
Operation:

```bash
# start the VcXsrv application
# now run the epicpy virtual machine
docker run --rm -it -e DISPLAY=YOUR_LOCAL_IP_ADDRESS:0.0 epicpy
```

Removal:

```bash
docker rmi -f epicpy
```
    

#### Accessing Files Outside the Virtual Machine

The `docker run` commands above will allow you to run the demo EPICpy models that are already inside the virtual machine, but they are only for demo purposes because they rest every time you start EPICpy under Docker. To reqlistically use EPICpy with Docker for EPIC modeling, you will need some way to work with files outside the virtual machine on your host computer. To do this, decide where you want your work folder to be. E.g., let's say we create a file on our host computer on the desktop called `epicwork` that contains the uncompressed devices.zip folder obtained earlier. To give the epicpy virtual machine read/**write** access to that folder, you would alter the docker run commands shown above as such:

**MacOS**

```bash
# start the XQuartz application
# now start EPICpy from within the epicpy virtual machine. You will need the ip address you printed out in the setup stage above.
xhost + YOUR_LOCAL_IP_ADDRESS
docker run -it --rm -e DISPLAY=YOUR_LOCAL_IP_ADDRESS:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /Users/YOUR_USERNAME/Desktop/epicwork:/home/nonroot/epicwork:cached epicpy
```

**Windows**

```bash
# start the VcXsrv application
# now run the epicpy virtual machine
docker run --rm -it -e DISPLAY=YOUR_LOCAL_IP_ADDRESS:0.0 -v c:\Users\YOUR_USERNAME\Desktop\epicwork:/home/nonroot/epicwork:cached epicpy
```

**Linux**

```bash
# start EPICpy from within the epicpy virtual machine.
xhost + local:docker
docker run -it --rm --env="DISPLAY" --net=hostv -v /home/YOUR_USERNAME/Desktop/epicwork:/home/nonroot/epicwork:cached epicpy
```

<mark>NOTE</mark>: I've had trouble on some Ubuntu machines with the mounted folder not having write permissions, preventing EPICpy from running. I tried one suggested solution...using this alternative syntax:

```bash
# start EPICpy from within the epicpy virtual machine.
xhost + local:docker
docker run -it --rm --env="DISPLAY" --net=hostv --mount src=/home/YOUR_USERNAME/Desktop/epicwork,target=/home/nonroot/epicwork,type=bind epicpy
```

but the permissions issue persists. <u>If anyone figures this out, please let me know</u>.

**That's It!**

Now when you go to load a device, you should see your `epicwork` folder listed alongside the static `devices` folder. Any change you make to files in `epicwork/devices` will persist and show up within the epicpy virtual machine, as well as on the corresponding folder on your host machine.

