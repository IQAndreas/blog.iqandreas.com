---
layout: post
title: "Understanding the AS3 Event System #2 - Custom Events"
date: 2010-10-12 07:53
comments: true
categories: [actionscript, understanding-the-as3-event-system]
tags: [ActionScript, ActionScript for Beginners, Understanding the AS3 Event System]
#series:
# name: Understanding the AS3 Event System
# index: 2
---

This thread is part 2 in the "[Understanding the AS3 Event System](/actionscript/understanding-the-as3-event-system/)" series. It continues on the "office" illustration used in [part 1](/actionscript/understanding-the-as3-event-system/part-1-the-basics). If you have not read part 1, it is recommended that you do so.

I originally wrote this thread as a response to a Kirupa forum thread:
[{% img favicon http://www.kirupa.com/favicon.ico %} http://www.kirupa.com/forum/showthread.php?t=355040](http://www.kirupa.com/forum/showthread.php?t=355040)

This is my first draft, so any opinions or thoughts are deeply appreciated, especially if there is anything you still don't fully understand or would like me to clarify further.
<!-- more -->

----------------

Listen, don't tell my boss, but those days when work gets slow, I fire up some StarCraft! StarCraft is no fun alone, so Nico, Bob, Larry, and I all play against eachother. The problem is that we all need to be logged on at the same time in order to play together. I'm the one who plays the most, so I am the "Game Master"; the one who starts up the server, chooses a map, and waits for everyone else to join in.

We need some way to alert each other when I start up a StarCraft game, _and_ keep it a secret from my boss (he reads all our emails, so I can't tell them via email). So, we use the Event system!


#### Custom Event Strings ####
We have planned that whenever I am about to start up a new game, I stand up and yell out to everyone _"I am about to call `Yamato`!"_ (who our boss assumes is one of my Japanese clients)

Everyone knows that the custom `event string` (also known as `event type`) for when everyone listening should play starcraft is `"Yamato"`. So, ahead of time, Nico, Bob, and Larry listen for my `"Yamato"` event:
```as3
homeButton.addEventListener("Yamato", startPlayingStarScraft);
```

Now, we may start playing dozens of different games, and I have chosen a different "code name" as the event string for each type of game:
```as3
homeButton.addEventListener("MarcoPolo", startPlayingAOE);
homeButton.addEventListener("Gelinor", startPlayingRuneScape);
homeButton.addEventListener("Germany", startPlayingCOD);
homeButton.addEventListener("Orcish", startPlayingWOW);
```

#### Custom Events ####
Now, I could create a different type of `Event` Folder for each type of game, such as `StarCraftEvent`, `RuneScapeEvent`, `AOEEvent` etc. 

Each type of event file would have information inside of it, for instance, the `StarCraftEvent` Folder may have the following properties:
 - _target_ - Me, since I'm the one "dispatching" the event
 - _type_ - the custom event string, in this case _"Yamato"_
 - _map_ - the StarCraft map we will be playing in
 - _players_ - a list of all players
 - _settings_ - the game settings

And our class would look something like this (note that `target` and `type` are automatically inherited by the `Event` since you `extend` it)
```as3
public class StarCraftEvent extends Event
{
    public function StarCraftEvent(the_type:String, the_map:SCMap, the_players:Array, the_settings:GameSettings)
    {
        //Since you extend the Event, let the super class know a few more additional details
        super(the_type);
        
        map = the_map;
        players = the_players;
        settings = the_settings;
    }
        
    public var map:SCMap;
    public var players:Array;
    public var settings:GameSettings
}
```

This would be my totally custom made event class! <img alt="" border="0" class="inlineimg" src="http://www.kirupa.com/forum/images/smilies/d_smile.gif" title="Big Smile" /> Perfectly customized for whenever we want to start a StarCraft game, allowing everyone to get the information they need!


#### Dispatching the Custom Event ####
This is exactly as simple as it was dispatching the `"clicked"` event:
```as3
//Create the event
var players:Array = [Andreas, Nico, Bob, Larry];
var scEvent:StarCraftEvent = new StarCraftEvent("<u>Yamato</u>", lostTemple, players, defaultSettings);

//Dispatch the event (and it's folder containing all the info)
dispatchEvent(scEvent);
```

That <u>dispatches an event</u> which alerts <u>everyone who is listening</u> that I am about to start up a StarCraft game.

So, Nico, Bob, and Larry run up to my cubicle and I hand them all the `StarCraftEvent` Folder containing ALL the information they need to join in the game.


### Do you really need to create Custom Events? ####
Now I can create a new Custom Event for each and every game we play and that would alright. 

But I noticed, no one really reads the information in the `Event` Folder! I spent good money putting together and printing out all the information for those folders, and no one reads them! They get the file from me, then run back to their own cubicles, fire up the game, and throw the `Event` Folder directly into the trash.

{% pullquote %}
When you think about it, {do they really **need** all that extra information} such as maps or players? They will find all that information out anyway when they start up StarCraft. There really is no use going into all the hassle of creating custom events!
{% endpullquote %}

Instead, what if I print out a plain old `Event` Folder? All it says is the `target` and the `type`, but if they want more information (which someone once in a while does) they can ask me for it directly.

FORGET about the hassle with the `StarCraftEvent` class, and just do this:
```as3
var eventFolder:Event = new Event("Yamato");
dispatchEvent(eventFolder);
```

99% of the time. That is all you will ever need. You save a lot of unnecessary work.


**You don't always need to create custom <u>Events</u>, usually it is enough just using custom <u>Event Strings</u>.**


That is Custom Events 101

Continue to [Part #3 - Easy Event Bubbling](/actionscript/understanding-the-as3-event-system/part-3-easy-event-bubbling)
