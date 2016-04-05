package;

/**
 * ...
 * @author 
 */
class OldInput
{
	private static var pressedKeys:Array<Bool>;
	private static var justPressedKeys:Array<Int>;
	private static var isInited:Bool;
	
	public static function init() {
		pressedKeys = [];
		justPressedKeys = [];
		isInited = true;
	}
	
	public static function down(key:Int):Bool {
		#if debug
			if (!isInited) throw("Input is not initialized!");
		#end
		return pressedKeys[key];
	}
	
	public static function justDown(key:Int) {
		return justPressedKeys.indexOf(key) > -1;
	}
	
	public static function setPressedKey(key:Int) {
		#if debug
			if (!isInited) throw("Input is not initialized!");
		#end
		if (!pressedKeys[key]) {
			pressedKeys[key] = true;
			justPressedKeys.push(key);
			trace("key pressed : "+key);
		}
	}
	
	public static function removePressedKey(key:Int) {
		#if debug
			if (!isInited) throw("Input is not initialized!");
		#end
		pressedKeys[key] = false;
	}
	
	public static function clearJustPressedKeys() {
		justPressedKeys.splice(0, justPressedKeys.length);
	}
}