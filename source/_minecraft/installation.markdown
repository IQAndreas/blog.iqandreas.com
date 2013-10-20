---
layout: page
title: "Installing Mods and Patches in MineCraft"
date: 2012-04-14 12:27
comments: false
sharing: true
footer: true
permalink: installation/index.html
---
The installation instructions are the same as most other MineCraft mods, but for completeness, full instructions have been included.

### Windows ###

1. Open up `%appdata%`, if you don't know how to do this, `start>run`, then type in `%appdata%`
2. Browse to `.minecraft/bin`
3. Open up `minecraft.jar` with WinRAR or 7zip.
4. Drag and drop the necessary files into the jar.
5. IMPORTANT: Delete the `META-INF` folder in the jar.
6. Run Minecraft, enjoy!


### Macintosh ###

1. Go to `Applications>Utilities` and open terminal.
2. Type in the following, line by line:
        {% codeblock %}
        cd ~
        mkdir mctmp
        cd mctmp
        jar xf ~/Library/Application\ Support/minecraft/bin/minecraft.jar
        {% endcodeblock %}
3. Outside of terminal, copy all the files and folders into the `mctmp` directory.
4. Back inside terminal, type in the following:
        {% codeblock %}
        rm META-INF/MOJANG_C.*
        jar uf ~/Library/Application\ Support/minecraft/bin/minecraft.jar ./
        cd ..
        rm -rf mctmp
        {% endcodeblock %}
5. Run Minecraft, enjoy!


-------------------------------------------------------------
Instructions taken from
[MineCraft Forum: Risugami's Mods Installation Instructions](http://www.minecraftforum.net/topic/75440-v125-risugamis-mods-everything-updated/)
