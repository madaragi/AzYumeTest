package;
import flash.geom.Point;

/**
 * FlashのPoint.add()が自身を変更しないのが気持ち悪かったので作ったラッパークラス
 * @author 
 */
abstract Vector2D(Point) 
{
	public var x(get, set):Float;
	inline function get_x(){return this.x; }
	inline function set_x(v:Float){
		this.x = v; 
		return this.x;
	}
	
	public var y(get, set):Float;
	inline function get_y(){return this.y; }
	inline function set_y(v:Float){
		this.y = v; 
		return this.y;
	}
	
	inline function new(p:Point) {
		this = p;
	}
	
	@:from public static inline function fromPoint(p:Point):Vector2D {
		return new Vector2D(p);
	}
	
	@:to public inline function toPoint():Point {
		return this;
	}
	
	public inline function add(p:Point) {
		this.x += p.x;
		this.y += p.y;
	}
	
	@:op(A + B) public static function opAdd(l:Vector2D, r:Vector2D):Vector2D {
		return new Point(l.x + r.x, l.y + r.y);
	}
}