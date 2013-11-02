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
	public var JUMP_FORCE:Int = 400;
	public var GRAVITY:Int = 980;
	
	public var hasGravity:Bool = true;
	public var speed:Point;
	public var drag:Float = 10;
	public var touchingDown:Bool=false;
	
	public function new(x:Float=0, y:Float=0, graphic:Graphic=null, mask:Mask=null) 
	{
		speed = new Point(0, 0);
		super(x, y, graphic, mask);
	}
	
	override public function update():Void 
	{
		if (hasGravity)
		{
			speed.y += GRAVITY*HXP.elapsed;
		}
		touchingDown = false;
		moveBy(speed.x * HXP.elapsed, speed.y * HXP.elapsed, "walls");
		
		speed.x -= speed.x * drag * HXP.elapsed;		
		super.update();
		
	}
	
	override public function moveCollideY(e:Entity):Bool 
	{
		speed.y = Math.min(speed.y,100);//this way touchingDown doesn't keep changing
		touchingDown = true;
		return super.moveCollideY(e);
	}
}