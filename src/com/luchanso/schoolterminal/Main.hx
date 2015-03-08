package com.luchanso.schoolterminal;

import com.luchanso.schoolterminal.CFPS;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.TouchEvent;
import openfl.Lib;
import openfl.system.TouchscreenType;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.ui.Multitouch;
import openfl.ui.MultitouchInputMode;

/**
 * ...
 * @author Loutchansky Oleg
 */

class Main extends Sprite 
{
	var fps : CFPS;

	public function new() 
	{
		super();
		
	//	draw();
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event) : Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		fps = new CFPS();
		
		var windowInfo = new TextField();
		windowInfo.defaultTextFormat = new TextFormat("Arial", 21, 0x232323);		
		windowInfo.text = "W: " + Lib.current.stage.stageWidth + " H: " + Lib.current.stage.stageHeight;
		windowInfo.x = 50;
		windowInfo.y = 50;
		windowInfo.autoSize = TextFieldAutoSize.LEFT;
		
		addChild(fps);
		addChild(windowInfo);		
		
		Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;		
		stage.addEventListener(TouchEvent.TOUCH_BEGIN, touchBegin);
		
		addEventListener(Event.ENTER_FRAME, update);
		
	}
	
	private function update(e:Event):Void 
	{
		
	}
	
	private function touchBegin(e:TouchEvent):Void 
	{
		
	}
}
