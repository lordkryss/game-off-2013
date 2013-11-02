package entities;
import com.haxepunk.graphics.Image;
import flash.geom.Point;

/**
 * ...
 * @author lordkryss
 */
class BigHero extends Hero
{

	public function new(x:Float=100, y:Float=100) 
	{
		set_graphic(Image.createRect(35, 40, 0x123456));
		direction = new Point();
		setHitboxTo(graphic);
		super(x, y);
		SPEED = 100;
		JUMP_FORCE = 400;
		mass = 2;
	}
	
}