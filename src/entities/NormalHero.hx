package entities;
import com.haxepunk.graphics.Image;
import flash.geom.Point;

/**
 * ...
 * @author lordkryss
 */
class NormalHero extends Hero
{

	public function new(x:Float=100, y:Float=100) 
	{
		set_graphic(Image.createRect(20, 20, 0x123456));
		direction = new Point();
		super(x, y);
	}
	
	override public function update():Void 
	{
		super.update();
	}
}