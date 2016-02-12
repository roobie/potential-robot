package logic;

import com.haxepunk.Entity;

import com.haxepunk.graphics.Image;
import com.haxepunk.tweens.motion.LinearMotion;

import util.Rand;

/**
 * ...
 * @author Bjorn
 */
@:final
class SimpleAI implements AI{

	var e:Entity;

	public function new(e:Entity) {
		this.e = e;
	}

	/* INTERFACE logic.AI */

	public function tick():Void {
		if (Math.random() < 0.5) { return; }
		e.moveBy(Rand.randInt(-2, 3), Rand.randInt(-2, 3));

		var i:Image = cast e.graphic;
		i.angle += 10;
	}

}
