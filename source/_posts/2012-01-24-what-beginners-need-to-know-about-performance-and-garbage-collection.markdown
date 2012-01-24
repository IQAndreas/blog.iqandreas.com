---
layout: post
title: "What Beginners need to know about Performance and Garbage Collection"
date: 2012-01-17 01:43
comments: true
categories: ActionScript
---
Another category of beginner questions that often appear on the [Kirupa forums](http://www.kirupa.com/forum/) are about performance and garbage collection. Some common concerns:

*   How do I make sure my `MovieClips` are garbage collected? Is setting everything to `null` enough?
*   Should I always remove all my event listeners?
*   Someone told me it's better to use `int` instead of `uint` because it's more efficient.
*   I used `while(--i)` instead, because it is much more efficient than `for` loops.
*   `hitTest()` is really slow! Every site tells me I should never use it.

My answer to all those questions: _Don't worry about it_.
<!-- more -->

Don't get me wrong, if you are the type of person who worries about these sorts of things right now, you will make a terrific developer one day! But worrying about these things now is just going to make your code more complicated and much more difficult to manage.

### Strive to make your code clear and readable ###

As a beginner, this should be your first and foremost rule. If you scratch your head every time you read your own code, coding will be overwhelming and debugging will be hell.

Take these two identical chunks of code as an example:

{% gist 1625219 compass_rotation_compact.as %}

{% gist 1625219 compass_rotation_expanded.as %}

The first chunk of code is much more efficient than the second, but I wouldn't want to be the developer that find bugs in that project.

### So should I never worry about performance? ###

Not at this point, no. First make sure you have learned the basics and syntax of ActionScript.
Then, make sure you **really** know the basics of ActionScript (instead of just thinking that you do while perched [on top of mount stupid](http://www.smbc-comics.com/?id=2475). Believe me, we have all been there). **Finally** you can start learning about standard coding conventions and basic performance improvements.

Keep in mind, most performance optimization tips (such as using `int` instead of `uint`) will shave _milliseconds_ off your total time if you do tens of thousands of calculations each frame.

Often times, the extra milliseconds won't make a hill of beans difference, so worrying about them while writing the code is a waste of resources. Test your code, and make sure your project works. Then, **if** (and only if!) there is a problem with performance after everything is complete and working, you can go back and find which areas need optimizing.


### Why Garbage Collection doesn't matter ###

Same principle as with optimization, don't worry too much about garbage collection unless you are building an enterprise-level application. Flash is actually pretty good at taking care of things for you and making sure everything gets disposed of properly. Even if it misses an image here or there, what is one measly Bitmap for a computer with +2GB of RAM? Users won't notice the difference if your game uses 17 MB instead of 16 MB.

And remember, it's **all** disposed once you close the SWF anyway.

