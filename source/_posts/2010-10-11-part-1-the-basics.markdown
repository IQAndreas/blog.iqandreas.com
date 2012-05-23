---
layout: post
title: "Understanding the AS3 Event System #1 - The Basics"
date: 2010-10-11 10:39
comments: true
categories: [actionscript, understanding-the-as3-event-system]
tags: [ActionScript, ActionScript for Beginners, Understanding the AS3 Event System]
#series:
# name: Understanding the AS3 Event System
# index: 1
---

This thread is part 1 in the "[Understanding the AS3 Event System](/actionscript/understanding-the-as3-event-system/)" series.

I originally wrote this thread as a response to a Kirupa forum thread:
[http://www.kirupa.com/forum/showthread.php?t=355040](http://www.kirupa.com/forum/showthread.php?t=355040)

This is my first draft, so any opinions or thoughts are deeply appreciated, especially if there is anything you still don't fully understand or would like me to clarify further.
<!-- more -->

-------------------

Imagine your code as one big office room. That office has about 100 or so cubicles, with each cubicle representing a different object. For instance, if you have five `Buttons` on the stage, it's not one `Button` cubicle, but instead five different cubicles, one for each `Button` instance.


#### The Event String/Event Type ####

Now, I'm sitting in the `homeButton` cubicle. One day, I get an email from my boss who tells me I have been _"clicked"_. So immediately I stand up, and yell out into the hallway so loudly that everyone can hear _"I HAVE BEEN CLICKED!"_

Now, the boss may have A LOT more information, such as where I was clicked, how many times, if any of my children were clicked, and a lot more information. However, I won't stand up and yell out to everyone in the building all that information. That is quite wasteful, and if I receive several of those emails a day, I would soon get tired of spouting out all that information. 

Instead, to save energy, I only tell everyone _"I have been <u>clicked</u>"_. That is me telling everybody the `event type`, also known as the `event string`.


#### Listening for Events ####
Back up a few hours (before the event string). I have a friend named Nico sitting in the art department (his cubicle is labeled `currentImage`, but that's not actually relevant). His boss told him _"Whenever Andreas in the `homeButton` cubicle is clicked I want you to draw an image of a house and send it right to me."_

Now, Nico could get up out of his seat every five minutes, walk over to me, and ask _"Hey, Andreas. Were you clicked yet?"_ I say no, so he walks back to his cubicle and sits down. This would happen again and again, and neither of us would get any work done. This is VERY inefficient. Nico could reduce this and only check with me once per hour, but he wants to know _immediately_ when I am clicked. So that is NOT an option either.

Instead, Nico sits in his cubicle continuing his regular work, and in the meantime, _listens_ out in the hallway for my voice. Now, at around noon I yell out _"I was <u>keypressed</u>!"_ He hears my voice, but he really doesn't care about the keypresses. So, he ignores what I say, and continues working. Then another guy in the cubicle (Larry, a really annoying guy) yells out _"I was <u>clicked</u>!"_ Since Larry is not as good looking as Andreas, and The Boss didn't tell Nico to listen to Larry, Nico ignores him completely.

Because, <u>Nico is only listening to</u> Andreas (in <u>the `homeButton` cubicle</u>) <u>for the `clicked` event</u> (which looks something like this in AS3):
```
homeButton.addEventListener("<u>clicked</u>", drawHouse);
```

When he hears the event, he needs to <u>start drawing the house</u> (which he does in the `drawHouse` function).


#### The Event is dispatched ####
Now, fast forward back to where we were. Me (Andreas) gets the call from my boss telling me I was `clicked`. So I stand up and yell out to everyone. _"I was <u>clicked</u>!"_

Two people were listening for my `clicked`, Nico and Bob (the guy from `contentManagement`, a very talkative fellow) Nico rushes up to me excited _"Hey Andreas. I heard about the click. That is awesome! Congratulations! {% img http://www.kirupa.com/forum/images/smilies/happy.gif Smilie %} But tell me more about the event! _Why were you clicked? Where were you clicked? Who clicked you? Why did they click you?_"

I could spend the next 5 minutes explaining all the juicy details to Nico, but then I would have to repeat all this information to Bob (which is very inefficient, and Bob is a busy man and doesn't want to wait). So instead, I print out all the information on the `clicked event` and put it into a Folder which I give to Nico. I give the folder to both Nico and Bob so they can use the information in it and look at it as they please. This folder is the `Event` object (more details on that later)

Immediatly Nico rushes to his art studio in his cubicle and gets to work at `drawHouse()`, however, now he has the Folder (the `Event`) he can use that information while drawing the house, and therefore passes it into the function as a parameter:
```
function drawHouse(<u>event:Event</u>)
{
    /* Draw stuff in here... */
}
```

#### The Event ####
To make sure that everyone gets the information they need, there are VERY strict protocols to what the `Event` Folder needs to contain. 

The following pages with information are required for standard Event Folders
* **the target** - the person dispatching the event, which in this case is me, Andreas (or actually the `homeButton` cubicle).
* **event type** - the type of event (aka `event string`), in this case, `clicked`.
<span style="font-size: xx-small;">(there are a few more pages in the file, but that's mostly the small legal mumbo-jumbo fine print that no one reads anyway. You will be fine ignoring them for now.)</span>

This is a standard `Event` file. But hold on, there was A LOT more information which is missing here! If I hand Nico a file with only those two pages of information in it, he will still wonder _"Where were you clicked?"_ along with MANY other important questions. Luckily, the company already has a neat system figured out!


#### The MouseEvent ####

Now, the company I work for has a second type of file, a `MouseEvent` File. This file `extends` the standard `Event` File. That means that the `MouseEvent` file has all the information contained in the plus a lot more information, perfect for when a `clicked` event happens.

It has the standard two fields (`target` and `type`) PLUS these additional pages with information: 
- _localX_
- _localY_
- _stageX_
- _stageY_
- _altKey_
- _ctrlKey_
And a whole lot more!

Note that this `MouseEvent` file ONLY is allowed to be used when dealing with events that had to do with the mouse, such as `clicked`, `hovered` etc. The file should NOT be used for events that had to do with the keyboard, `keypressed` or `keyreleased`. Those events should instead use a specialized `KeyboardEvent` File with it's own special properties.


So I print out all the relevant information and hand both Nico and Bob a `MouseEvent` folder. Using that information, they draw the houses, display text, or whatever they want to do with the information.

_(**Extra note:** Maybe Bob didn't even need to see the file. Maybe he just needed to know that I was clicked, so when I hand him the file, he may not even open it or look at the details of the click using the information inside. That's fine by me, but I still need to create the file in case there is someone out there who actually needs the information.)_


#### Creating the MouseEvent ####
Bob and Nico don't want to wait for me to print out and collect all the papers needed in the `MouseEvent` file. They want the information to be ready the second they step up to my cubicle. So, BEFORE I stand up and tell everyone I was clicked, I create the folder ahead of time for quick and easy access. THEN, <u>I `dispatch` it to all who are `listening`</u>.

This is how it looks in ActionScript:
```
//create the folder with all the information in it
var eventFolder:MouseEvent = new MouseEvent("<u>clicked</u>", bla, bla, localX, localY, bla, bla, bla, bla, more bla);

//Now stand up and tell everyone I was clicked
//The "eventFolder" already says the **event type** is "clicked",
// so I don't need to repeat myself when dispatching it.
//All I need to do is dispatch the folder and Flash will do all the dirty work
dispatchEvent(eventFolder);
```

Now Nico and Bob (and whoever else is `listening`) can react to it and get to see the folder I sent when `dispatching`:
```
function drawHouse( <u>andreasEventFolder:MouseEvent</u> )
{
    /*Draw stuff in here...*/
}
```

That is Events 101.

Continue to [Part #2 - Custom Events](/actionscript/understanding-the-as3-event-system/part-2-custom-events)
