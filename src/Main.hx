import com.haxepunk.Engine;
import com.haxepunk.HXP;
import mconsole.Console;

class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable();
		Console.start();
#end
		//HXP.scene = new MainScene();
		HXP.scene = new scenes.GameScene();
	}

	public static function main() { new Main(); }

}