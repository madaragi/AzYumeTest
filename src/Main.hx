package;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageQuality;
import flash.display.StageScaleMode;
import flash.Lib;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.KeyboardEvent;

@:bitmap("bin/resources/testchipA.png")
class ChipA extends BitmapData {}

/**
 * ...
 * @author 
 */
class Main 
{
	public static inline var SCREEN_WIDTH = 800;
	public static inline var SCREEN_HEIGHT = 640;
	
	static function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		stage.quality = StageQuality.LOW;
		
		Filters.init();
		OldInput.init();
		
		stage.addChild(new Input(stage));
		
		// Entry point
		//stage.addChild(new Player());
		var screen:Sprite = new Sprite();
		stage.addChild(screen);
		screen.addChild(new Player());
		screen.y = 0;
		screen.scaleX = 3;
		screen.scaleY = 3;
		screen.opaqueBackground = 0xFFCC99;
		screen.graphics.beginFill(0xFFEEDD);
		screen.graphics.drawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		screen.graphics.endFill();
		//var screen:Bitmap = new Bitmap(new BitmapData(SCREEN_WIDTH, SCREEN_HEIGHT, false, 0xFFBB99);
		
		var chipA = new Bitmap(new ChipA(0, 0));
		screen.addChild(chipA);
		chipA.x = 50;
		chipA.y = 30;
		//chipA.scaleX = 2;
		//chipA.scaleY = 2;
		
		var textLayer = new TextLayer(0,340);
		stage.addChild(textLayer);
		
		var charaLayer = new CharacterLayer();
		charaLayer.x = -50;
		charaLayer.y = 240;
		stage.addChild(charaLayer);
	}
}