# Text Editors for EPIC Modeling.

Although almost any real text editor will work for EPIC modeling, I recommend you use a **_programmer's text editor_**. Often, the default "text editor" on an operating system is ill-suited for modeling. In particular, **TextEdit.app** on MacOS and **Notepad.exe** on Windows are poor choices. I personally use **Sublime Text** for editing EPIC rules. In my classes on EPIC, I have had good luck with the **Pulsar Editor** (based on the now abandoned **Atom Editor**). Finally, in the before time (in the long-long ago), when I used Apple computers, I used BBEdit (formerly TextWrangler).

There are dozens of good programmers text editors. The reason I'm mentioning the ones I use or have used in the past is because I have created syntax-highlighting definitions for EPIC production rules when using those editors. In case you don't know what syntax-highlighting is. Be default, if you were to load a rule file into one of these editors (or any other editor), it would look like this:

[![Rule Text Without Highlighting](resources/images/editor_rules_no_highlighting.png)](resources/images/editor_rules_no_highlighting.png)

However, with syntax highlighting enabled, the same text would appear like this:

[![Rule Text Without Highlighting](resources/images/editor_rules_with_highlighting.png)](resources/images/editor_rules_with_highlighting.png)

This is much easier to read and results in fewer errors of various kinds.

Below are instructions for installing text editors for which I have already created syntax-highlighting definitions for. They are cross-platform and free to use unless otherwise noted.

## Pulsar Text Editor (Formerly Atom)

### Installing Pulsar

You can download an executable installer for Pulsar on your operating system here:

[https://pulsar-edit.dev/download.html](https://pulsar-edit.dev/download.html)

### Set Up Pulsar to Syntax-Highlight EPIC Rule Files

#### Linux and MacOS

Close Pulsar and then enter this into a terminal:

```bash
ppm install language-epic
```

#### Windows

On Windows, installing Pulsar will not put ppm on your path. In fact, it puts the old `apm` file in a folder on your machine _something_ like this:

`C:\Users\YOURUSERNAME\AppData\Local\Programs\Pulsar\resources\app\ppm\bin`

Therefore, to install the syntax highlighting file on Windows, you will enter _something_ like this:

```bash
C:\Users\YOURUSERNAME\AppData\Local\Programs\Pulsar\resources\app\ppm\bin\apm.cmd install language-epic
```

### Try it!

Now open Pulsar and load a .prs rule file. You should see pretty colors.

**NOTE**: If you have previous experience with Atom or Pulsar, you may wonder why I'm not suggesting that this package be installed from the GUI facility within Pulsar. Currently, only about 80 packages appear available this way and language-epic isn't one of them, even though it was formerly available in both Atom and Pulsar.

<hr/>

## Sublime Text Editor [<font color="orange">PAID, but continuous free trial</font>]

### Download Sublime Text

You can obtain Sublime Text at [https://www.sublimetext.com/](https://www.sublimetext.com/). These instructions should work with the [current version of Sublime Text](https://www.sublimetext.com/download) (currently, version 4.x), but I've only tested them with [Sublime Text version 3.x](https://www.sublimetext.com/3).

### Install Package Control

Open the `Tools` menu.
Select `Package Control`

This will download the latest version of Package Control. **If that doesn't work**, use this manual method (copied from https://packagecontrol.io/installation):

1. Click the Preferences > Browse Packages… menu
2. Browse up a folder and then into the Installed Packages/ folder
3. Download [Package Control.sublime-package](https://packagecontrol.io/Package%20Control.sublime-package) and copy it into the Installed Packages/ directory
4. Restart Sublime Text

### Install Package Development Tool

1. Go to `Preferences`-->`Package Control`.
2. Then type in _**install**_ until you see "**Package Control: Install Package**" and click on it.
3. Now type _**PackageDev**_ and click on it. Wait a moment (a progress messages may briefly show in the bottom left of Sublime Text's main window.)

### Install the Syntax Highlighting Definition for EPIC's Rule Files

1. Go to `Tools`-->`Packages`-->`Package Development`-->`New Syntax Definition`
2. Sublime will give you a sample syntax definition file called "**untitled**".
3. Clear out all the default text.
4. Copy and paste the contents of the [Subline Text EPIC-rules Syntax Highlighting File](resources/other/epicrules.sublime-syntax) into this window.
5. Now go to the menu and choose `File`-->`Save As`. Note that it will automatically point to some folder like `Sublime-text/Packages/User`, which is the right location!
Save the file you just edited into this folder with this _exact_ filename: "**epicrules.sublime-syntax**".

### Try it

Open up any .prs file, it should automatically be detected as a rule file and you should see colorful syntax highlighting!

<hr/>

## BBEdit Text Editor [<font color="purple">MacOS Only</font>]


## Downloading BBEdit

There is a paid and free mode of BBEdit. Here is what they say about this on their webpage:

    BBEdit offers a 30-day evaluation period. During that period, all of BBEdit’s features are available. When it ends, you can still use BBEdit — with no nag screens or unsolicited interruptions, for free, forever. After the evaluation period, you may re-enable all of BBEdit’s exclusive features at any time by purchasing a license.

- Download BBEdit from here: [http://www.barebones.com/products/bbedit/download.html](http://www.barebones.com/products/bbedit/download.html).

- Install like any other Mac app. 

## Settling Up Syntax Highlighting for EPIC Rule Files

- Download the [BBEdit EPIC-rules Syntax Highlighting File](resources/other/productionrule.plist) and save it as `productionrule.plist`.

You _may_ need to start and then close BBEdit for the following instructions to work:

- copy the file `productionrule.plist` to the folder `/Users/YOURUSERNAME/Library/Application Support/BBEdit/Language Modules/`

**NOTE**: If somehow you are using an old copy of TextWrangler instead of BBEdit (which has superseded it), then this will still work if you copy `productionrule.plist` to this folder instead: `/Users/YOURUSERNAME/Library/Application Support/TextWrangler/Language Modules/`

## Try it

Open up any .prs file, it should automatically be detected as a production-rule file, and you should see colorful syntax highlighting!