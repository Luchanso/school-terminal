package com.luchanso.schoolterminal;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Button extends Sprite
{
	var textField : TextField;
	
	public function new(text : String, x : Float = 10, y : Float = 10)
	{
		super();
		
		this.x = x;
		this.y = y;
		
		textField = new TextField();
		textField.defaultTextFormat = new TextFormat("Arial", 21, 0xFFFFFF);
		textField.text = text;
		textField.x = 5;
		textField.y = 20 - textField.textHeight / 2;
		textField.autoSize = TextFieldAutoSize.LEFT;
		textField.selectable = false;
		textField.mouseEnabled = false;
		
		addChild(textField);
		
		draw();
	}
	
	public function draw()
	{
		graphics.beginFill(0x8080FF);
		graphics.drawRoundRect(0, 0, textField.width + 5 * 2, 40, 5, 5);
		graphics.endFill();		
	}
}