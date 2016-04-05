package;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

@:bitmap("bin/resources/b.png")
class CharaExp1 extends BitmapData {}

/**
 * ...
 * @author 
 */
class CharacterLayer extends Sprite
{

	public function new() 
	{
		super();
		var b = new Bitmap(new CharaExp1(0, 0));
		addChild(b);
	}
	
}