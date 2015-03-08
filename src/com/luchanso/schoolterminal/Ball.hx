package com.luchanso.schoolterminal;
import openfl.display.Sprite;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Ball extends Sprite
{

	public function new() 
	{
		super();
		
		graphics.beginFill(0xFF0000);
		graphics.drawCircle(0, 0, 5);
		graphics.endFill();
	}
	
}