package ;
import com.haxepunk.HXP;

/**
 * ...
 * @author lordkryss
 */
class Camera
{

	public static var x:Float = 0;
	public static var y:Float = 0;
	private static var floatCameraX:Float = 0;
	private static var floatCameraY:Float = 0;
	
	public static var speed:Float = 3;
	
	public static function init()
	{
		floatCameraX = HXP.camera.x;
		floatCameraY = HXP.camera.y;	
	}
	
	public static function update():Void 
	{	
		floatCameraX += (x-HXP.halfWidth - floatCameraX) * HXP.elapsed * speed;
		floatCameraY += (y - HXP.halfHeight - floatCameraY) * HXP.elapsed * speed;
		
		HXP.camera.x = Std.int(floatCameraX);
		HXP.camera.y = Std.int(floatCameraY);
	}
	
}