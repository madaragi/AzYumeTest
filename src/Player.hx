package;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;

@:bitmap("bin/resources/player.png")
class PlayerBitmap extends BitmapData{}

enum PlayerState {
	STAND;
	RUN;
}

/**
 * ...
 * @author 
 */
class Player extends Sprite
{
	var jumpSpeed:Float = 2.0;
	var walkSpeed:Float = 1.3333;
	var gravity:Float = 0.1;
	var hFlip:Bool = false;
	var vFlip:Bool = false;
	var acl:Float = 0;
	var vel:Float = 0;
	var pos:Point = new Point(0, 0);
	var animation:MovieClip;
	var state:PlayerState;
	
	public function new() 
	{
		super();
		pos.x = 120;
		pos.y = 80;
		acl = gravity;
		state = STAND;
		
		/*
		var standImg:Bitmap = new Bitmap(new PlayerBitmap(0, 0));
		standImg.x = -standImg.width / 2;
		standImg.y = -standImg.height / 2;
		addChild(standImg);
		*/
		animation = new PlayerAnimation();
		addChild(animation);
		
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
			if(state == STAND) {
				if (Input.down(Key.D) || Input.down(Key.A)) {
					animation.gotoAndPlay("run");
					state = RUN;
				}
			}
			if(state == RUN) {
				if (Input.down(Key.D)) {
					pos.x += walkSpeed;
					hFlip = false;
				}
				else if (Input.down(Key.A)) {
					pos.x -= walkSpeed;
					hFlip = true;
				}
				else {
					state = STAND;
					animation.gotoAndPlay("stand");
				}
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