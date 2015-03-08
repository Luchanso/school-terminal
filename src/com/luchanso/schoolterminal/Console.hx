package com.luchanso.schoolterminal;


import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Console extends TextField
{
	public function new(x : Float = 10, y : Float = 10, width : Float = 500, height = 500)
	{
		super();
		
		this.x = x;
		this.y = y;		
		this.width = width;
		this.height = height;
		
		this.defaultTextFormat = new TextFormat("Arial", 21, 0xA50FFF);
		this.border = true;
		this.borderColor = 0xA50FFF;		
		this.wordWrap = true;
		
		this.log("Hello Loutchansky Oleg, my name is console, and i am working");
		this.log("Я знаю 한국의 язык и даже умею рисовать ♥♥♥");
	}
	
	public function log(s : Dynamic) : Void
	{
		this.text += "\n" + Std.string(s);
	}
}