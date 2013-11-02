package entities;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.Mask;
import com.haxepunk.math.Vector;
import com.haxepunk.utils.Input;
import flash.geom.Point;

/**
 * ...
 * @author lordkryss
 */
class Hero extends Movable
{
	var direction:Point;
	
	public function new(x:Float=100, y:Float=100) 
	{
		super(x, y, graphic, mask);
		set_graphic(Image.createRect(20, 20, 0x123456));
		direction = new Point();
		setHitboxTo(graphic);
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
			speed.y = Math.max(speed.y,-JUMP_FORCE / 2);
		speed.x = direction.x * SPEED;	 
		super.update();
	}
}