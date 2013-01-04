---
layout: post
title: "Why my one line if statements are unusual"
date: 2013-01-04 13:02
comments: true
categories: [actionscript]
---
My one line if statements have been described as _"um... unique"_ and _"making me cringe"_, but trust me, there is method to this madness; mainly, it's practical for debugging.<!-- more --> The sample code is in ActionScript, but should be self-explanatory in any language with similar semantics:

```as3
if ((data.length > 0) && server.enabled)
	{ server.send(data); }
```

_The average developer_ doesn't include those extra braces on the second line, and in fact, many will even keep everything on one single line. (You could also pull the braces down so the block of code occupies a full 4 lines of code, but that seems highly unnecessary.)

```as3
if ((data.length > 0) && server.enabled) server.send(data);
```

The reason I add these otherwise unnecessary braces is primarily for debugging. Say in our sample code, the data isn't arriving at the server; a good developer goes back to make sure the data is being sent in the first place. The following function _looks_ correct (and as a side note should work in a white-space oriented language such as Python), but does not function as expected:

```as3
if ((data.length > 0) && server.enabled)
	server.send(data); trace("Data sent");
	
// or even
if ((data.length > 0) && server.enabled)
	server.send(data);
	trace("Data sent");
	
// But my personal preference allows for the additional code:
if ((data.length > 0) && server.enabled)
	{ server.send(data); trace("Data sent"); }
```

A good developer is smart enough to add the required brackets when adding the "debugging code". I prefer adding the brackets preemptively; the extra time it takes to wrap the code in brackets isn't that valuable to me.


_(I also have a personal philosophy that `if`, `for`, `do`, and `while` should always be followed by an open bracket containing code rather than just code on its own, but that just has to do with the way I view the language as functioning behind the scenes. But it's more difficult convincing other developers based on those grounds.)_

