import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.tmx.TmxEntity;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import entities.BigHero;
import entities.Hero;
import entities.NormalHero;
import openfl.Assets;

class MainScene extends Scene
{
	public override function begin()
	{
		//HXP.stage.color = 0xFFbababa;
		
		setUpInput();
		
		addTestLevel();
		
		createHeroes();
		
		Camera.init();
		
		add(new NormalHero());
		//add(new BigHero());
	}
	
	override public function update()
	{
		Camera.update();
		super.update();
	}
	
	function createHeroes() 
	{
		Hero.normal = new NormalHero();
		Hero.big = new BigHero();
	}
	
	function addTestLevel() 
	{
		// create the map
		//trace(Assets.getText("maps/test.tmx"));
		var e = new TmxEntity("maps/test.tmx");

		// load layers named bottom, main, top with the appropriate tileset
		e.loadGraphic("graphics/tiles.png", ["test"]);

		// loads a grid layer named collision and sets the entity type to walls
		e.loadMask("test", "walls");

		add(e);
	}
	
	function setUpInput() 
	{
		Input.define("right", [Key.D, Key.RIGHT]);
		Input.define("left", [Key.A, Key.LEFT]);
		Input.define("jump", [Key.W, Key.UP]);
		Input.define("down", [Key.S, Key.DOWN]);
	}
}