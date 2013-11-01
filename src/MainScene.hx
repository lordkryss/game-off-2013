import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import entities.Hero;

class MainScene extends Scene
{
	public override function begin()
	{
		HXP.stage.color = 0xFFbababa;
		add(new Hero());
		
		setUpInput();
	}
	
	function setUpInput() 
	{
		Input.define("right", [Key.D, Key.RIGHT]);
		Input.define("left", [Key.A, Key.LEFT]);
		Input.define("jump", [Key.W, Key.UP]);
		Input.define("down", [Key.S, Key.DOWN]);
	}
}