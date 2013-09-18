---
layout: post
title: "Understanding the AS3 Event System #3 - Easy Event Bubbling"
date: 2010-10-19 07:23
comments: true
categories: [actionscript, understanding-the-as3-event-system]
tags: [ActionScript, ActionScript for Beginners, Understanding the AS3 Event System]
#series:
# name: Understanding the AS3 Event System
# index: 3
---

This thread is part 3 in the "[Understanding the AS3 Event System](/actionscript/understanding-the-as3-event-system/)" series. It continues on the "office" illustration used in [part 1](/actionscript/understanding-the-as3-event-system/part-1-the-basics) and [part 2](/actionscript/understanding-the-as3-event-system/part-2-custom-events). If you have not read the previous parts, it is recommended that you do so.

This part describes how _"Event Bubbling"_ works. Note that this is a strong simplification of the actual system (which is a bit more complex, but in the next part I will elaborate on that system), but for 99% of all Event uses, this is the only thing you really need to know about Event Bubbling.
<!-- more -->

-----------------

At the office I work, a large part of our work system is set up as a hierarchy of responsibility and work delegation.

#### The Corporate Ladder ####
At the very top of the tree is Mr. Stan Stage. He's a great guy. Very friendly, a nice father figure, and a really good boss. He is the boss of all bosses, and in the end, everyone reports to him.

Since there is so much information passed around the office each day, he delegates most of the tasks to a handful of people who work right under him. These people are all _"second in command"_. One of these second in command is my boss. Unlike Mr. Stage, my boss is very annoying and difficult, and to avoid his wrath, I will exclude his name, and instead just call him _"My Boss"_.

My Boss has about 20 people working under him, including me. It's not a great position to be in, but it's still a very rewarding job. Some of us _"third in command"_ workers have people working directly under us.

I am one of the lucky ones, and have five interns working directly for me. Since I am their boss, they obey my every whim, such as getting coffee for me each morning, or taking out my dry-cleaning. Even though they are only interns, they are still considered to be _"fourth in command"_.


Since a great deal of what we do at the Office is reported via `Events`, my interns are expected to use the event system to report any changes just like the rest of us.

For efficiency's sake, my five interns have their desks very close to my cubicle, so whenever they `dispatch` an `event` (by standing up and shouting for example _"I was <u>hovered</u>!"_) I hear it immediately.

Now, there are two types of _Events_; Events that Bubble, and Events that do not Bubble.


#### Non-Bubbling Events ####

Some Events are only important to the person to which it actually happened. For instance, one day one of my interns, Chris, stands up and yells _"Hey everyone, I got a <u>new car</u>!"_
```as3
dispatchEvent(new Event("new_car"));
```

A few of my other interns reacted. However, I honestly did not care. My Boss sure as hell doesn't care. And as nice of guy Steve Stage is, he really doesn't care either.

I'm not saying that Chris's `Event` wasn't important, in fact, it was quite important since it allows him to do his job better and will definitely affect his work. However, there is no need to tell as many people about it as possible. The only people who need to know about the event are people who specifically asked Chris to let them know whenever he got a new car.
```as3
chris.addEventListener("new_car", talkToChrisAboutTheCar);
```

Those Events <u>do not Bubble</u> up the corporate ladder.


#### Events that Bubble ####

Now, clicks are VERY important in my line of work (in fact, that's how we get paid).

We want to let as many people as possible who want to know about the clicks to know about the clicks, but if every single person just stood up and yelled _"Someone was clicked!"_ whenever they found out about it, it would be one disorganized mess and you would hear about the same gossip from eight different people. Instead, we have an organized system for letting everyone in charge know about it.


#### Bubbling Events up the Ladder ####

One day Chris stands up and yells out to everyone _"I was <u>clicked</u>!"_ (`dispatching` the `event` to everyone that may be `listening` to him. Not many people are usually listening to Chris (in fact, most people at the office don't even know any of my interns). So, Chris only tells everyone specifically listening to him about the `"click"` event.

Then Chris walks over to me and says _"Andreas. I was <u>clicked</u>. All the information on the click is available in this Event folder."_

Now it's my turn. I stand up and yell _"I was <u>clicked</u>!"_ (I could tell them _"someone in my department was clicked"_, but since my interns work for me so closely, their work is considered to be part of my work) A few people are listening to me for the `"clicked"` event, (including Nico and Bob) and walk up to me asking for more information. I give them both the file so they have all the information on the event that they need.

Then, I barge into the office of my Boss, telling him all about the event, and handing him a copy of the information. He in turn switches on his fancy intercom system (since he is second in command, he gets certain perks, and is paid too much to have to yell across the hallway) and announces to everyone in the office _"Attention anyone who is listening to me. I was just <u>clicked</u>."_ A few people are `listening` to him, and respond.

Finally, my Boss knocks on the door of Steve Stage and tells him all about the click event. Now, at last, Mr. Stage announces the `"click"` event for the **last** time, telling everyone who is `listening` to him about the "click".

After that it is done. Everyone who needs to know about the `Event` knows about it.


#### Now why is Bubbling so important? ####

Let's take the example of Betty, who works in accounting. In order to do her job property, she needs to know about every single time a client `"clicked"` an employee.

She could listen to every single employee for the `"click"` event, but this is a VERY inefficient system. And every time there is a new employee she would need to start listening to them, and when an employee leaves, she needs to remember to stop listening to them.

Instead, because of our nifty little bubbling system, Betty ONLY needs to listen to Mr. Stage for the `"click"` event. Since those events `bubble` up to Steve Stage, she will be notified of **every single click event** directly from Steve Stage.


#### EXTRA NOTE: Events only bubble upwards ####

Let's say one day I'm working at my desk, when a client `"clicks"` me directly instead of clicking one of my interns. I stand up and yell to everyone who is listening to me that _"I was <u>clicked</u>"_, but I do not need to directly tell any of my interns about the click. Unless my interns are specifically listening to me, they will not know about the click and will keep carrying on their work undisturbed. The interns will NOT dispatch any `"click"` event either.

The only one who needs to know is My Boss. The events only bubble "up" the corporate ladder, not down.


#### So who was clicked first? ####
In order to file the proper paperwork (and hand out promotions or raises where needed) Betty needs to know exactly which person it was who was `"clicked"` first. Luckily, all this information is perfectly filled out in the `Event` object (the folder containing all the information).

There are two names in the `Event` object, `target` and `currentTarget`. Flash assigns these two names automatically when the `Event` is dispatched.

These two properties tend to cause a lot of confusion among beginners. Sometimes they refer to the same person, sometimes they do not. To explain the difference, let's take another example.


Nico is listening to me for the `"clicked"` event.
```as3
andreas.addEventListener("clicked", onClick);
```

Chris, my intern, is clicked, and stands up and tells everyone about it. Nico doesn't even know Chris and therefore doesn't even know about the event. Chris tells me about the event and hands me all the information.

Now, I stand up and tell everyone _"I was clicked"_. Nico is listening to me (Andreas) for the event, and walks over to gather all the information.

Then the event continues to bubble upwards to My Boss and finally Stan Stage.

**target** refers to the person who first dispatched the event. In this case, Chris would be the target.
**currentTarget** refers to the person you were listening to who told you about the event.

Think about `currentTarget` for a second. For Nico, `currentTarget` would refer to me, <u>Andreas</u>. However, since Betty is listening to Stan Stage for the Event, the `currentTarget` property in her event file would refer to <u>Mr. Stage</u>.


#### Using currentTarget to your advantage ####
Why does the `currentTarget` property even exist? I mean if you added the event listener to an object, of course you know what that object is, and therefore the property is pretty much worthless.

However, if used properly, it can save you a lot of code! For instance, perhaps you have several buttons on the stage `homeButton`, `aboutButton`, `contactButton`, `newsButton`, etc. You want the button to scale up when it is clicked. You could add the event listeners like this:

```as3
homeButton.addEventListener(MouseEvent.CLICK, homeButtonClicked);
aboutButton.addEventListener(MouseEvent.CLICK, aboutButtonClicked);
contactButton.addEventListener(MouseEvent.CLICK, contactButtonClicked);
newsButton.addEventListener(MouseEvent.CLICK, newsButtonClicked);

function homeButtonClicked(mouseEvent:MouseEvent):void
{
   homeButton.scaleX = 1.2;
   homeButton.scaleY = 1.2;
}

function aboutButtonClicked(mouseEvent:MouseEvent):void
{
   aboutButton.scaleX = 1.2;
   aboutButton.scaleY = 1.2;
}
//etc...
```

That means, creating a different handler function for each button, which works, but creates **a lot** of extra code. Then if you want to change details of what happens when a button is clicked, you would need to update every single function.

Instead, you can create _one single function_ which handles the clicks of _all_ buttons. You can calculate which button needs to be pressed by using the `currentTarget` property.

```as3
homeButton.addEventListener(MouseEvent.CLICK, navigationButtonClicked);
aboutButton.addEventListener(MouseEvent.CLICK, navigationButtonClicked);
contactButton.addEventListener(MouseEvent.CLICK, navigationButtonClicked);
newsButton.addEventListener(MouseEvent.CLICK, navigationButtonClicked);

function navigationButtonClicked(mouseEvent:MouseEvent):void
{
   var pressedButton:DisplayObject = mouseEvent.currentTarget as DisplayObject;
   pressedButton.scaleX = 1.2;
   pressedButton.scaleY = 1.2;
}
```

That's a lot less code! Now, if you need to change the scaling to 1.3, you only have to update it in one single place!


If you want to attach additional properties to the buttons, (such as setting some custom scale value for each button) you can use the Dictionary object. Look in the FAQ under the appropriate category for links to explanations and example code:
[http://iqandreas.blogspot.com/2009/09/most-common-flash-questions-as3-faq.html](http://iqandreas.blogspot.com/2009/09/most-common-flash-questions-as3-faq.html)

This is how Flash bubbles its events.

Next step, how to make your own events bubble (The fourth part of this series is still on my TODO list ;)

