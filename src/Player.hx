package;

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;

@:bitmap("bin/resources/player.png")
class PlayerBitmap extends BitmapData{}

enum Direction {
	RIGHT;
	LEFT;
}

/**
 * ...
 * @author 
 */
class Player extends Sprite
{
	var jumpSpeed:Float = 2.0;
	var walkSpeed:Float = 2;
	var gravity:Float = 0.1;
	var hFlip:Bool = false;
	var vFlip:Bool = false;
	var acl:Float = 0;
	var vel:Float = 0;
	var pos:Point = new Point(0, 0);
	
	
	public function new() 
	{
		super();
		pos.x = 120;
		acl = gravity;
		
		var standImg:Bitmap = new Bitmap(new PlayerBitmap(0, 0));
		standImg.x = -standImg.width / 2;
		standImg.y = -standImg.height / 2;
		addChild(standImg);
		
		addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			if (filters.length > 0) {
				filters = [];
			}
			else {
				filters = [Filters.filter];
			}
		});

		//毎フレーム処理
		addEventListener(Event.ENTER_FRAME, function(e:Event) {
			if (Input.down(Key.D)) {
				pos.x += walkSpeed;
				hFlip = false;
			}
			else if (Input.down(Key.A)) {
				pos.x -= walkSpeed;
				hFlip = true;
			}
			
			if (Input.justDown(Key.S)) {
				vFlip = false;
			}
			if (Input.justDown(Key.W)) {
				vFlip = true;
			}
			
			if (Input.justDown(Key.SPACE)) {
				vel = -jumpSpeed;
			}
			
			vel += acl;
			pos.y += vel;
			if (vel > 2) {
				vel = 2;
			}
			if (pos.y > 80) pos.y = 80;
			
			x = Math.ceil(pos.x);
			y = Math.ceil(pos.y);
			
			//表示反転
			if (hFlip) scaleX = -1;
			else scaleX = 1;
			if (vFlip) scaleY = -1;
			else scaleY = 1;
		});
	}
	
}