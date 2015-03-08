package com.luchanso.schoolterminal;

import openfl.display.FPS;
import openfl.events.Event;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class CFPS extends FPS
{

	public function new(x:Float=10, y:Float=10) 
	{
		var color = 0x0000FF;
		super(x, y, color);
		
		this.defaultTextFormat = new TextFormat("Arial", 21, 0x0000FF);
	}
	
	override function this_onEnterFrame(event : Event) : Void
	{
		super.this_onEnterFrame(event);
		
		if (this.currentFPS < 30)
		{
			this.textColor = 0xFF0000;
		}
		else if (this.currentFPS > 30 && this.currentFPS < 60)
		{
			this.textColor = 0xFFA900;
		}
		else if (this.currentFPS > 60)
		{
			this.textColor = 0x00FF00;
		}
	}
	
}