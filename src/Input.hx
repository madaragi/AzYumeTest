package;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.KeyboardEvent;

/**
 * ...
 * @author 
 */
class Input extends Sprite
{
	private static var pressedKeys:Array<Bool>;
	private static var justPressedKeys:Array<Bool>;
	
	public function new(stage:Stage) 
	{
		super();
		pressedKeys = [];
		justPressedKeys = [];
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent) {
			if (!pressedKeys[e.keyCode]) {
				pressedKeys[e.keyCode] = justPressedKeys[e.keyCode] = true;
				//trace("key pressed : "+e.keyCode);
			}
		});
		stage.addEventListener(KeyboardEvent.KEY_UP, function(e:KeyboardEvent) {
			pressedKeys[e.keyCode] = false;
		});
		stage.addEventListener(Event.EXIT_FRAME, function(e:Event) {
			justPressedKeys.splice(0, justPressedKeys.length);
		});
	}
	
	public static function down(key:Int):Bool {
		return pressedKeys[key];
	}
	
	public static function justDown(key:Int) {
		return justPressedKeys[key];
	}
}