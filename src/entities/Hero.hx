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
	}
	
	
	override public function update():Void 
	{
		direction.x = 0; direction.y = 0;
		if (Input.check("right"))
			direction.x++;
		if (Input.check("left"))
			direction.x--;
		acceleration.x = direction.x * 100;		 
		super.update();
	}
}