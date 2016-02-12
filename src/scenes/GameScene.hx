package scenes;

import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Backdrop;

import areas.SimpleArea;
import entities.Grass;
import entities.Actor;
import logic.AI;
import logic.SimpleAI;
import util.Pos;

import tink.concurrent.Thread;
import tink.concurrent.Mutex;
import tink.concurrent.Queue;

using util.Arrays;

class GameScene extends Scene
{

	var actors:Array<AI> = new Array<AI>();

	var m:Mutex = new Mutex();

	var partCount:Int = 2;
	var mx:Array<Mutex> = [];

	public function new()
	{
		super();

		for (i in 0...partCount) {
			mx.push(new Mutex());
		}
	}

	public override function begin()
	{
		addGraphic(new SimpleArea());


		var middleX = Math.floor(HXP.stage.width / 2);
		var middleY = Math.floor(HXP.stage.height / 2);

		trace(middleX, middleY);

		//var entityCount = 1024;
		//var entityCount = 2048;
		var entityCount = 24;
		for (i in 0...entityCount) {
			//var b = new Grass(middleX, middleY);
			var b = new Actor(new Pos(middleX, middleY));
			var ai = new SimpleAI(b);
			this.actors.push(ai);
			add(b);
		}

		//addGraphic(new Backdrop("graphics/bd_1.png"));

	}

	function updateActors():Void {
#if concurrent
		Sys.sleep(.1);
#end
		for (a in actors) {
			a.tick();
		}
	}

	var bgFrameRate:Float = 1/20;
	function updateSliceOfActors(ais:Array<AI>):Void {
#if concurrent
		Sys.sleep(bgFrameRate);
#end
		for (a in ais) {
			a.tick();
		}
	}

	override public function update() {
#if concurrent
		// new Thread(function () {
		// 	if (m.tryAcquire()) {
		// 		updateActors();
		// 		m.release();
		// 	}
		// });

		var parts = actors.partition(partCount);
		for (p in 0...parts.length) {
			var m = mx[p];
			new Thread(function () {
				if (m.tryAcquire()) {
					updateSliceOfActors(parts[p]);
					m.release();
				}
			});
		}

#else
		updateActors();
#end

		super.update();
	}
}
