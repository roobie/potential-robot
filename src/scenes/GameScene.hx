package scenes;

import areas.SimpleArea;
import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import entities.Grass;
import logic.AI;
import logic.LogicLoop;
import logic.SimpleAI;
import tink.RunLoop;
import tink.runloop.Worker;
import tink.concurrent.Thread;
import tink.concurrent.Mutex;
import tink.concurrent.Queue;


class GameScene extends Scene
{

	var actors:Array<AI> = new Array<AI>();

	//var threads:Array<Thread> = null;

	var m:Mutex = new Mutex();
	//var q:Queue = new Queue();

	public function new()
	{
		super();

	}

	public override function begin()
	{
		addGraphic(new SimpleArea());


		var width = Math.floor(HXP.stage.width / 2);
		var height = Math.floor(HXP.stage.height / 2);

		for (i in 0...2048) {
			var b = new Grass(320, 240);
			var ai = new SimpleAI(b);
			this.actors.push(ai);
			add(b);
		}


	}

	function updateActors():Void {
		for (a in actors) {
			a.tick();
		}
	}

	override public function update() {

		#if concurrent
		new Thread(function () {
			if (m.tryAcquire()) {
				updateActors();
				m.release();
			}
		});
		#end

		super.update();
	}
}