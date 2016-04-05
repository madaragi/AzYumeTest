package;
import flash.display.Shader;
import flash.filters.ShaderFilter;
import flash.utils.ByteArray;

//色調反転
@:file("bin/resources/channelscrambler.pbj")
class Channelscrambler extends ByteArray{}

/**
 * ...
 * @author 
 */
class Filters
{
	public static var filter(default,null):ShaderFilter;

	public static function init() {
		var shader:Shader = new Shader(new Channelscrambler());
		filter = new ShaderFilter(shader);
	}
}