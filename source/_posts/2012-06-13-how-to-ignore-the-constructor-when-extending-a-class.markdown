---
layout: post
title: "How to Ignore the Constructor when Extending a Class"
date: 2012-06-13 08:47
comments: true
categories: [actionscript]
---
As we all know, if you don't call `super()` in your constructor's code, the Flash compiler will automatically append it to your constructor's code.

Turns out, this isn't entirely true. The compiler only adds `super()` if it doesn't see it written out in the constructor. It makes no distinction whether you actually call it or not. Here is a simple little trick if you want to completely hop over calling `super()` when creating a sub-class.<!-- more --> 

{% gist 2922489 %}

If you want more reading on the matter, this information was taken from a forum thread by [Krilnon](http://me.reclipse.net/) over at the Kirupa forums.
[{% img smiley /images/icons/icon_kirupa_orange.gif %} [TIP] Skipping super() - Interesting behavior](http://www.kirupa.com/forum/showthread.php?363399-Tip-Skipping-super()-Interesting-behavior)

But remember, as I brought up in the forum thread linked to above:
{% blockquote %}In my opinion, this is pure evil! No good can come of not calling constructors, none at all...{% endblockquote %}

So use with caution!
