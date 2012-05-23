---
layout: post
title: "Experiment: Drop Painter"
date: 2011-06-03 17:12
comments: true
categories: [actionscript, experiments]
tags: [ActionScript, Experiments]
---
No, it's not painting with drops (though, that seems like a great idea for another project). Instead this experiment drops pieces of a painting down from above which eventually form to assemble a complete picture.

[{% img center http://iqandreas.isbetterthanyou.org/public/kirupa.com/square-contest-2011/experiment-drop-painter-preview-image.png %}](http://iqandreas.isbetterthanyou.org/public/kirupa.com/square-contest-2011/)
_Click the image to go open the SWF_
<!-- more -->

The code is written in AS3 and uses [Box2D](http://www.box2dflash.org/) for the physics and [MinimalComps](http://www.minimalcomps.com/) for the components.

At first I wrote the code up as a prototype just to test a concept (and rather than rewrite the code cleanly, I just kept adding onto it so it became one tightly-coupled mess). 

I later entered it into a [contest](http://www.kirupa.com/forum/showthread.php?362779-Information-and-Rules!) held on the [Kirupa Forums](http://www.kirupa.com/forum/), and modified it slightly to fit the contest theme.


[The source is available on GitHub](https://github.com/IQAndreas/Drop-Painter-Experiment) in case anyone is curious how it was achieved (and yes, I did cheat. It's not actually dynamic. The movement of all those shapes are "pre-baked" during the "Loading" screen and simply played back afterwards, which is why it is able to take up so little CPU on playback. {% img smiley http://www.kirupa.com/forum/images/smilies/trout.gif %}
