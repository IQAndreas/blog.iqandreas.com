---
layout: post
title: "GIT: How to move tags"
date: 2013-11-17 06:43
comments: true
categories: [git]
---

Say you already added a tag, but later realized that it was in the wrong place, or perhaps you needed to add a few more last-minute commits. How would you go about moving it?<!-- more -->

**Unrelated but important side note:** Since you are tagging in Git, [you are using the `-a` flag, right?](http://www.rockstarprogrammer.org/post/2008/oct/16/git-tag-does-wrong-thing-default/)

### Editing the tag locally

You could <span class="hoverable" title="git tag -d <tag_name>">delete it</span> and <span class="hoverable" title="git tag -a <tag_name>">re-add it</span>, but all the hard work you put into writing the tag's description would be lost.

Instead, choose the place in your history where you want the tag moved to, tag it like you usually would, but add `-f` (or `--force`) to the command; that extra flag will allow you to replace the other tag with the same name. And a pleasant surprise appears if we try to overwrite an existing tag:

{% img /images/blog/git-terminal-window-overwrite-existing-tag.small.png "Terminal window in Ubuntu editing a GIT tag" %}

_Hey! That's my old tag description!_ Now you can edit it if you want, or just save it as the way it was.

### Editing the tag on the server

If you have already pushed the tag to the server and want to fix that, first make sure your local version of the tag is correct. Then all you need to do is make another `push` using the same `-f` (or `--force`) flag.

```
 $ git push origin --tags -f
```

Remember to alert any other developers on the team if you ever "force" a change like this. If they still have an "old" version of the tag around, it may cause conflicts when they try to push to the server!

### If the tag is edited on the server, but the local one is old

Say _someone else_ moved a tag, but the version in your local repository still points to the old commit? First, delete the local tag, then pull in the changes from the remote repo; the new tag will be added automatically.

So, for example (in my case, the tag name is `v2.56` and the remote repository is named `origin`):

```
 $ git tag -d v2.56
Deleted tag 'v2.56' (was 75ff2f1)
 $ git fetch origin --tags
From https://github.com/FlixelCommunity/flixel
 * [new tag]         v2.56      -> v2.56
```

In this example, the `--tags` flag was actually optional, since `git fetch` will by default automatically fetch tags along with any modified branches. But there is no harm leaving it in there for clarity.



