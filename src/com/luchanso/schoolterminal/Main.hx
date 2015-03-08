package com.luchanso.schoolterminal;

import com.luchanso.schoolterminal.CFPS;
import com.luchanso.schoolterminal.Console;
import openfl.display.Loader;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.HTTPStatusEvent;
import openfl.events.MouseEvent;
import openfl.events.TouchEvent;
import openfl.Lib;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.system.TouchscreenType;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.ui.Multitouch;
import openfl.ui.MultitouchInputMode;
import openfl.utils.SystemPath;
#if !html5
import sys.FileSystem;
import sys.io.File;
#end

/**
 * ...
 * @author Loutchansky Oleg
 */

class Main extends Sprite 
{
	var fps : CFPS;
	var console : Console;
	var button : Button;
	var balls : Map<Int, Sprite>;
	//var loader : URLLoader;

	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event) : Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		balls = new Map<Int, Sprite>();
		
		fps = new CFPS();
		
		console = new Console(50, 50, Lib.current.stage.stageWidth - 50 * 2, Lib.current.stage.stageHeight - 50 * 2);		
		
		button = new Button("Run tests", 50, Lib.current.stage.stageHeight - 45);		
		button.addEventListener(MouseEvent.CLICK, getInfo);
		
		addChild(fps);
		addChild(console);
		addChild(button);
		
		Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;		
		stage.addEventListener(TouchEvent.TOUCH_BEGIN, touchBegin);
		stage.addEventListener(TouchEvent.TOUCH_END, touchFinish);
		
	}
	
	public function getInfo(_) : Void
	{
		console.log("Размеры окна: W( " + Lib.current.stage.stageWidth + ") H(" + Lib.current.stage.stageHeight + ")");
		console.log("Count Multitouch: " + Multitouch.maxTouchPoints);
		
		#if !html5
		console.log("Test Create Directonory");		
		FileSystem.createDirectory(SystemPath.applicationDirectory + "/test");
		
		console.log("Test File Save in " + SystemPath.applicationDirectory + "/test");
		
		File.saveContent(SystemPath.applicationDirectory + "/test/test.txt", "Hello world");
		if (File.getContent(SystemPath.applicationDirectory + "/test/test.txt") == "Hello world")
		{
			console.log("Tests: create file and directory is success");
		}
		else
		{
			console.log("Tests: create file and directory is bad");
		}
		
		console.log("Begin check internet");
		
		var url = new URLRequest("http://ya.ru");
		var loader = new URLLoader();
		loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, status);		
		loader.load(url);
		console.log("Request to http://ya.ru...");
		#end
	}
	
	private function status(e:HTTPStatusEvent):Void 
	{
		console.log("HTTP status: " + e.status);
		console.log("HTTP Test is success");
	}
	
	
	
	private function touchFinish(e:TouchEvent):Void 
	{
		removeChild(balls.get(e.touchPointID));
		balls.remove(e.touchPointID);
	}
	
	private function touchBegin(e:TouchEvent):Void 
	{
		console.log("Touch Event - event ID: " + e.touchPointID + " Absolute: {x: " + e.stageX + "; y: " + e.stageY + "} size: " + Math.sqrt(Math.pow(e.sizeX, 2) + Math.pow(e.sizeY, 2)));
		
		var ball = new Ball();
		ball.x = e.stageX;		
		ball.y = e.stageY;
		
		balls.set(e.touchPointID, ball);
		addChild(ball);
	}
}
