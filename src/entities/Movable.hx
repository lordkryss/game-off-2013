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
	public var SPEED:Int = 150;
	public var JUMP_FORCE:Int = 500;
	public var GRAVITY:Int = 980;
	
	public var hasGravity:Bool = true;
	public var speed:Point;
	public var drag:Float = 10;
	public var touchingDown:Bool = false;
	public var mass:Float = 1;
	
	public function new(x:Float=0, y:Float=0, graphic:Graphic=null, mask:Mask=null) 
	{
		speed = new Point(0, 0);
		super(x, y);
	}
	
	override public function update():Void 
	{
		if (hasGravity)
		{
			//trace(mass);
			speed.y += GRAVITY*mass*HXP.elapsed;
		}
		touchingDown = false;
		moveBy(speed.x * HXP.elapsed, speed.y * HXP.elapsed, "walls");
		
		speed.x -= speed.x * drag * HXP.elapsed;		
		super.update();
		
	}
	
	override public function moveCollideY(e:Entity):Bool 
	{
		if (speed.y > 0)
		{
			speed.y = Math.min(speed.y, 100);//this way touchingDown doesn't keep changing
		}else
		{
			speed.y *= 0.5;
			//trace("MY HEAD!");
		}
		if (collide("walls", x, y + 1) != null)
		{
			touchingDown = true;
		}
		return super.moveCollideY(e);
	}
}