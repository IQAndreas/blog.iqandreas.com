---
layout: post
title: "The things I hate in Git"
date: 2013-11-17 07:42
comments: true
categories: [git]
publish: false
---

I love Git to pieces, but there are a few things that annoy me constantly.


### Inconsistent flag naming

```
git stash list
git branch --list  # But to be fair, the command does the same thing without the flag
git remote  # no `--list` flag or anything
```

```
git stash drop
git branch -d
git remote remove
```


### The default behavior of `git branch`

Tell me, how often do you create a new branch, but want to stay on the current one? _It happens once or twice_. 

How often do you create a branch, and then want to switch to it immediately? _Pretty much all the time_. 

Sadly, the command `git branch <new_branch_name>` will by default do the former.

I would much prefer to change the default behavior, and instead have an optional flag like `--stay`:

```
git branch fix-camera-bug --stay
```

Sure, you _could_ run `git checkout -b <new_branch_name>`, but I see the `checkout` command as a way of jumping between branches, not of creating them. Still, I would much prefer if by default you automatically switched to new branches when you create them.

### Git orphan

It's surprisingly often that you want to 



### Inconsistent use of 

BEGINNER WARNING:

```
repo/branch
repo:branch
repo branch
```


### The inconsistent use of "checkout"

BEGINNER WARNING

One minute, `git checkout` changes branches, the next minute, 

Also, `git reset` and `git fetch`.



### Branches named 0a

```
git branch 0a
```

Fine, this one is my fault, and not Git's, but about 1/4th of the times I try to list all branches (`-a`), I accidentally create a new branch named `0a`. I guess my right pinky just isn't dexterous enough. :(


Is there anything you 





