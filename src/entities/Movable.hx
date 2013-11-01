package entities;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.HXP;
import com.haxepunk.Mask;
import com.haxepunk.math.Vector;
import flash.geom.Point;

/**
 * ...
 * @author lordkryss
 */
class Movable extends Entity
{
	public var gravity:Point;
	public var acceleration:Point;
	public var speed:Point;
	public var drag:Float = 10;
	
	public function new(x:Float=0, y:Float=0, graphic:Graphic=null, mask:Mask=null) 
	{
		gravity = new Point(0, 0);
		acceleration = new Point(0, 0);
		speed = new Point(0, 0);
		super(x, y, graphic, mask);
	}
	
	override public function update():Void 
	{
		speed.x += acceleration.x;
		speed.y += acceleration.y;
		speed.x -= speed.x * drag * HXP.elapsed;
		speed.y -= speed.y * drag * HXP.elapsed;
		moveBy(speed.x*HXP.elapsed, speed.y*HXP.elapsed);
		super.update();
	}
}