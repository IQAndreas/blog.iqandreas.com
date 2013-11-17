---
layout: post
title: "What are the default permissions for files in Ubuntu?"
date: 2013-11-17 10:54
comments: true
categories: [ubuntu]
---

_**TL;DR version:** Skip to [In a nutshell]({{ page.url }}#summary)._

By default, when you create a file in Ubuntu as a standard user (either in Nautilus or with `touch`), it gets the permission of `644`. If you mark that file as executable, as expected, it gets the permission `755`.

What may be surprising is that directories also have a default permission of `755`. Even though it seems like directories aren't the type of thing that would be "executed", this flag is actually very important to Linux! <!-- more -->(and if anyone can find an article behind the reasoning behind this decision, I would love to find out)

If a directory (or _any_ of its parent directories) isn't marked as executable, you cannot `cd` into it. Although it is browsable in Nautilus, trying to write anything to the folder results in a "forbidden" or "insufficient privileges" error message. Some commands (like `ls`) work on the directory, while others (such as `stat`) do not.

Links (both to files and directories) have the permission `777`, which I'm assuming is done for the similar reasons as the executable bit on directories.


### On external media

For external harddrives, USB drives, or SD cards that are mounted in `/media/<username>`, if you haven't manually changed either the mount settings or file system format of the drive, the file system type is likely to be either `Fat32` or `NTFS`. Here, the file permissions are going to be different, with a value of `600` for files and `700` for directories. Links remain the same at `777`, though it is unclear to me if links created in Linux are stored differently or not on foreign file systems.

As far as I can tell, there is no way to change file and directory permissions, or even mark files as being executable without changing the mount settings, so all files are always stuck with a privilege of `600`. This makes sense as such file systems don't use the same type of permission settings for files, so storing the permission data would be difficult. In fact, I'm just glad we are able read from and write to those types of file systems from Linux at all!

### <a name="summary"></a>In a nutshell

These are the default values for file permissions in Ubuntu 13.10. They may be the same in other Linux distributions, but I have not been able to verify this personally.

**In a standard ext3 file system**

 * `644` files
 * `755` executable files
 * `755` directories
 * `777` links to files
 * `777` links to directories

**For removable media (Fat32) and windows partitions (NTFS)**

 * `600` files (can't be executable)
 * `700` directories
 * `777` links to files
 * `777` links to directories


### A script for better displaying file permissions in a directory

While you can display the permissions of files in a directory with `ls -l`, that information isn't very easy to read:

```bash
 $ ls -l
total 16
drwxr-xr-x 2 andreas andreas 4096 Nov 17 11:00 cat-images-folder
-rw-r--r-- 1 andreas andreas  245 Nov 17 10:58 cat-images.zip
-rwxr-xr-x 1 andreas andreas   30 Nov 17 11:15 do-something.sh
lrwxrwxrwx 1 andreas andreas   56 Nov 17 11:23 Link to cat-images-folder -> /home/andreas/temp/cat-images-folder
lrwxrwxrwx 1 andreas andreas   53 Nov 17 11:22 Link to cat-images.zip -> /home/andreas/temp/cat-images.zip
-rw-r--r-- 1 andreas andreas 1922 Nov 17 11:15 readme.txt
```

Instead, you can instead use the `stat` command to display permissions in the more friendly "octal notation" ([source](http://thenubbyadmin.com/2012/02/16/how-to-list-linux-file-permissions-in-octal-notation/)):

```bash
 $ stat -c "%a %n" *
755 cat-images-folder
644 cat-images.zip
755 do-something.sh
777 Link to cat-images-folder
777 Link to cat-images.zip
644 readme.txt
```

And if you want to tweak the output further (such as to tell us whether an item is a file, directory, or link), see the following page (or just run `man stat`) which lists all available options:

{% flink http://manpages.ubuntu.com/manpages/precise/en/man1/stat.1.html "Ubuntu manuals: stat" %}




