---
layout: post
title: "Ubuntu: Adding FDT to the list of Applications"
date: 2012-01-17 08:48
comments: true
categories: [actionscript, actionscript-in-ubuntu]
#categories: [Actionscript, Actionscript in Ubuntu]
tags: [ActionScript, ActionScript in Ubuntu, FDT]

---
In this guide, we will add FDT to the list of installed applications, and optionally, install a script which "resets" the internal SWFViewer in case it won't open after closing improperly.

{% img center /images/blog/fdt-in-ubuntu-applications-menu.png FDT in Ubuntu Applications Menu %}
<!-- more -->

_The following guide was written for 32bit FDT5, but may still work for future or previous versions of FDT. These instructions can of course also be used for any application that doesn't come with an Ubuntu installer, adjusting the  files appropriately._

If you are running Ubuntu, I'm assuming you already know how to use the basics of the command line and how to manipulate (create, delete, change permissions) of files. If anyone wants more details, post a comment and I'll clarify.

I'm assuming you have already [downloaded FDT](http://fdt.powerflasher.com/buy-download/) (they have a free version if you aren't already using FDT) and extracted the archive.

I would recommend saving the files to `/opt/fdt5` (may require admin access, which is easily done without messing with the command line by running `gksu nautilus`, assuming you are still using the default file browser) Depending on what extraction tool you use, you may also need to change the permission settings for the files to allow folder access for all users.

### Download the FDT5 Launcher files ###

If you want to do this the easy way, download the pre-made files from the [GitHub repository](https://github.com/IQAndreas/FDT-Ubuntu-Launcher-Files) and install them to the locations specified in the README.

[{% img favicon /images/icons/icon_archive.gif %} https://github.com/IQAndreas/FDT-Ubuntu-Launcher-Files/zipball/master](https://github.com/IQAndreas/FDT-Ubuntu-Launcher-Files/zipball/master)

You are all done. Enjoy!

Alternatively, you can do all the dirty work yourself (if so, keep reading).

### Creating the FDT5 Launcher Files manually ###

Create a new file named FDT5.desktop with the following contents:

{% gist 1626770 fdt5.desktop %}

If you want the file to be available to all users of the computer, save the file in 
- `/usr/share/applications/`
Alternatively, if you only want the currently logged in user to have FDT show up in the application menu, save the file to 
- `~/.local/share/applications/`

Next, create the following script, and save it as `/usr/bin/fdt5`

{% gist 1626770 fdt5 %}

Note that the script may be a tad more complicated than it needs to be, but this is the script I'm using since I had to jump through a few hoops getting FDT to work properly in Ubuntu.


You also need to set the icon for the application. The default Eclipse icon is okay, but on my system, both Eclipse for Java and [FB4Linux](http://code.google.com/p/fb4linux/) use that same icon, so I would prefer being able to tell them apart.

I included FDT's fancy, blue dodecahedron icon [in the repository](https://github.com/IQAndreas/FDT-Ubuntu-Launcher-Files/blob/master/fdt-icon.png), used with permission from Powerflasher GmbH. You can use the icon provided in the repository, or use your own, but which ever icon you use for FDT, make sure to save it to `/opt/fdt5/fdt-icon.png`

Finally, if you want FDT to stay in the launcher bar, start up FDT, right-click the icon in the launcher, and make sure "Keep in Launcher" is checked.

{% img center /images/blog/fdt-in-ubuntu-launcher-keep-in-launcher.png FDT in the Ubuntu Launcher. Right click and make sure "Keep in Launcher" is checked. %}

### Cleaning the SWFViewer settings ###

If the built in FDT SWFViewer quits improperly (which happens from time to time when running into AS3 errors) it will not open the next time you run the SWF. The solution is to delete a few config files for the plugin, which is a simple task, but gets annoying when you need to constantly delete the files.

The following script will delete said config files (assuming FDT is installed to `/opt/fdt5` as recommended) though I wish FDT had a button for this inside the IDE instead.

{% gist 1626770 fdt5-clean %}

Save the script to `/usr/bin/fdt5-clean` and run it by typing `fdt5-clean` into the command prompt. The script does not require admin rights to run as long as your FDT install folder has full permission for all users.


Leave any further questions or problems in the comments and I'll try to help sort them out.
