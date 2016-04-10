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
		
		var endNotice = new Bitmap(new BitmapData(20, 20, false, 0x000000));
		endNotice.x = 640;
		endNotice.y = 100;
		endNotice.visible = false;
		addChild(endNotice);
		
		var speaker = new TextSpeaker(endNotice);
		speaker.x = 220;
		speaker.y = 6;
		addChild(speaker);
		
		speaker.speak("いやいや 絶対おかしいでしょ。上手いこと言って自分の都合のいいように解釈しようとしてない？");
		speaker.addText(["これは二番目の文章", "ちなみにこれは3番目の文章で、改ページするためにちょっと長めにしゃべってる"]);
		//　[cp] = change paragraph
		// [exp:angry] = expression
	}
}