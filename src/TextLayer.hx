package;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

@:font("bin/resources/JKG-L_3.ttf")
class JKFont extends Font {}

/*
@:font("bin/resources/mgenplus-1pp-bold.ttf")
class MgenFont extends Font {}
*/



/**
 * ...
 * @author 
 */
class TextLayer extends Sprite
{

	public function new(x:Int, y:Int) 
	{
		super();
		this.x = x;
		this.y = y;
		
		var bg = new BitmapData(Main.SCREEN_WIDTH, Main.SCREEN_HEIGHT-400, true, 0x99FFFFFF);
		var bgBitmap = new Bitmap(bg);
		addChild(bgBitmap);
		
		
		var speaker = new TextSpeaker();
		speaker.x = 220;
		speaker.y = 6;
		addChild(speaker);
		
		speaker.speak("いやいや 絶対おかしいでしょ");
		//　[cp] = change paragraph
		// [exp:angry] = expression
	}
}