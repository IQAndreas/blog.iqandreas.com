---
layout: post
title: "The top 5 things I hate in programming"
date: 2013-09-30 08:21
comments: true
categories: 
published: false
---
Every language has its flaws. Some are understandable, while others just get on my nerves.

Here is the list of the top five programming symantics I hate the most (in reverse order).<!-- more -->

### The way a package is defined in Action Script 3 ###

Although it makes sense symantically, when you define a class in Action Script, it needs to be wrapped in a `package` block:

```as3
package com.iqandreas.shapes
{
	import flash.display.Sprite;
	public class Circle extends Sprite
	{
		public function Circle()
		{
			this.draw(50, 0xAAAAAA);
		}
		
		public function draw(radius:Number, color:uint):void
		{
			this.graphics.beginFill(color);
			this.graphics.drawCircle(stage.stageWidth / 2, stage.stageHeight / 2, radius);
			this.graphics.endFill();
		}
	}
}
```

This results in an additional level of indentation, which I feel is a bit uneccessary. Keep in mind that you can only have one package per file in AS3, so it's not like you can close the current `package` block and open a new one with a different name.

Java and Haxe both have a much nicer way of dealing with this:

```haxe
package com.iqandreas.shapes;

import flash.display.Sprite;
public class Circle extends Sprite
{
	public function new()
	{
		this.draw(50.0, 0xAAAAAA);
	}
	
	public function draw(radius:Float, color:UInt):void
	{
		this.graphics.beginFill(color);
		this.graphics.drawCircle(flash.Lib.current.stage.stageWidth / 2, flash.Lib.current.stage.stageHeight / 2, radius);
		this.graphics.endFill();
	}
}
```

### The words "width" and "height" are two different lengths ###

This is an annoyance with the English language instead, yet trickles down into your code. Don't you just hate it when your code isn't indented nicely?

```as3
sprite.x = (stage.stageWidth / 2) - (sprite.width / 2);
sprite.y = (stage.stageHeight / 2) - (sprite.height / 2);
```

You could manually fix this by adding spaces:

```as3
sprite.x = (stage.stageWidth  / 2) - (sprite.width  / 2);
sprite.y = (stage.stageHeight / 2) - (sprite.height / 2);
```

But along with `left` and `right`, I still see this as an annoyance brought about from the English language.

### When the last item in a function is automatically returned ###

In languages such as Ruby, although the statement `return` exists, it is almost never used. Instead, the function returns the value of the last line in it. 

```ruby
def load_users(data)
	
end
```

This makes returning or nothing difficult (which in worst-case scenarios could pose a security flaw). If you want to really return nothing, you need to manually `return nil`. This I have yet to actually see done in a public project; most of the time, they do this:

https://github.com/mojombo/jekyll/blob/2b84173eca620855b5c32cd39f583ba2e9a4608b/lib/jekyll/layout.rb#L40

_Returns nothing you say? Your comments say one thing, but the code says another: I'm getting a string back from that function. I will close my eyes and hope users will just ignore the return value._


I think I can afford typing out six extra characters every time I want to return a value.


### Weakly typed variables ###

Although some languages (such as ActionScript) allow you to skip the type

Languages such as JavaScript, Python, and Ruby are always weakly typed!







