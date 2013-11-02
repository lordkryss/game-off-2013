package entities;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Mask;
import com.haxepunk.math.Vector;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import flash.geom.Point;

/**
 * ...
 * @author lordkryss
 */
class Hero extends Movable
{
	var direction:Point;
	public static var big:BigHero;
	public static var normal:NormalHero;
	
	public function new(x:Float=100, y:Float=100) 
	{
		super(x, y);
		setHitboxTo(graphic);
		//originX = Std.int(width / 2);
		//originY = Std.int(height);
		originX = Std.int(halfWidth);
		originY = Std.int(height);
		graphic.x = -originX;
		graphic.y = -originY;
	}
	
	
	override public function update():Void 
	{
		direction.x = 0; direction.y = 0;
		if (Input.check("right"))
			direction.x++;
		if (Input.check("left"))
			direction.x--;
		if (Input.pressed("jump") && touchingDown)
			speed.y = -JUMP_FORCE;
		if (Input.released("jump"))
			speed.y = Math.max(speed.y, -JUMP_FORCE / 2);
			
		speed.x = direction.x * SPEED;	
		
		super.update();
		
		if (Input.pressed(Key.J))
		{
			become(normal);
		}
		if (Input.pressed(Key.K))
		{
			become(big);
		}
		
		HXP.camera.x = x-HXP.halfWidth;
		HXP.camera.y = y - HXP.halfHeight;
		//trace(touchingDown +" " + speed.y);
	}
	
	public function become(who:Hero) 
	{
		HITBOX.update();
		who.x = this.x;
		who.y = this.y;
		who.speed = this.speed;
		
		HXP.scene.add(who);
		HXP.scene.remove(this);
		HXP.scene.updateLists();
		if (!who.fixPosition())
		{
			HXP.scene.add(this);
			HXP.scene.remove(who);
		}
	}
	
	function fixPosition():Bool
	{
		var fixed = false;
		var e = collide("walls", x, y);
		//trace(e);
		if (e == null)
		{
			fixed = true;//nothing to fix
		}else
		{
			for (diff in 0...width)
			{
				if (collide("walls", x+diff, y) == null)
				{
					fixed = true;
					x = x+diff;
					break;
				}else if (collide("walls", x-diff, y) == null)
				{
					fixed = true;
					x = x-diff;
				}else if (collide("walls", x, y+diff) == null)
				{
					fixed = true;
					y = y+diff;
					break;
				}
			}
		}
		return fixed;
	}
}