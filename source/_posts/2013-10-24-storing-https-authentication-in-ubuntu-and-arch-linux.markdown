---
layout: post
title: "GIT: Storing HTTPS Authentication in Ubuntu (and Arch Linux)"
date: 2013-10-24 03:48
comments: true
categories: [git]
---

_**TLDR version:** Skip to [Storing your HTTPS credentials using a Keyring]({{ page.url }}#storing-your-https-credentials-using-a-keyring)._

If you use GIT in Ubuntu, you may be used to this seeing this several times a day:

{% img /images/blog/git-terminal-window-in-ubuntu-small.png GIT Terminal window in Ubuntu asking for credentials %}

Tired of constantly typing typing in your credentials? (especially since GitHub requires an alpha-numerical password, so your standard, "easy-to-type" one won't do)<!-- more -->

### If you can use SSH, use it

SSH is more secure (and although I have not confirmed this officially, it seems to transfer faster than HTTPS). If it is _at all_ possible, use SSH instead of HTTPS. _I would be using SSH myself if it wasn't for a known bug in the modem required by my ISP which constantly drops the connection mid-transfer; Damn you Telia!_

When using SSH, you only have to "generate" a key once for every computer you use, store it in the appropriate directory, and every time you connect to GitHub, that key will be used automatically:

{% flink https://help.github.com/articles/generating-ssh-keys "GitHub Help: Generating SSH Keys" %}

#### If the SSH port is being blocked

If it's just an issue of blocked ports, GitHub does provide a service for creating an SSH connection (usually `port 22`) through the HTTPS port (`port 443`) which may get past most firewalls. I'm unsure if this is preferable to connecting over HTTPS or not, but at least the option is available:

{% flink https://help.github.com/articles/using-ssh-over-the-https-port "GitHub Help: Using SSH over the HTTPS port" %}


### <a name="storing-your-https-credentials-using-a-keyring"></a>Storing your HTTPS credentials using a Keyring

_SIDE NOTE:_ There are a lot of old solutions circling the interwebs involving either setting `credential.helper` to `store`, or by using `netrc`, however, in both of these cases the password gets stored as plain-text on your computer. This is usually not ideal.

Instead, you can use `gnome-keyring` to store your credentials more securely ([thanks to James Ward and marcosdsanchez](http://stackoverflow.com/a/14528360/617937) for this solution). _This solution assumes you are using GIT 1.8.0 or newer, which if you installed it via `apt`, you are. If not, you can find the latest version of git from the following URL:_

{% flink http://git-scm.com/downloads "Git: Downloads" %}

```bash
$ sudo apt-get install libgnome-keyring-dev
$ sudo make --directory=/usr/share/doc/git/contrib/credential/gnome-keyring
$ git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
```

If you are using Arch Linux, you will require [a slightly different command](http://stackoverflow.com/a/13390889/617937), and if you are using OS-X or Windows, GitHub has provided a short set of instructions to use the same GIT feature:

{% flink https://github.com/blog/1104-credential-caching-for-wrist-friendly-git-usage "GitHub Blog: Credential Caching for Wrist-Friendly Git Usage" %}

After typing in your user-name and password once the next time you are prompted for it, the credentials should be stored, saving you a lot of typing in the future. If that worked, you are done.

### But if you are a real stickler for security

If you _really_ want to require entering your password when connecting to GitHub (perhaps you are dealing with security software and want to avoid any loopholes) but are just tired of typing it in all day, you can configure GIT to store your password for a limited amount of time.

By default, GitHub will store your credentials for 15 minutes. If you want to increase or decrease this amount, use the following command:

```bash
 $ git config --global credential.helper "cache --timeout=900"
```

Replace `900` with [the amount of seconds you want the credentials to be saved](https://www.google.com/#q=15+minutes+to+seconds). Personally, I would recommend 5 hours (`18000` seconds) if you work in an office, and 12 hours (`43200` seconds) if you work from home. If you don't want this setting to apply for all your repositories but only for the current repository, remove the `--global` flag.



