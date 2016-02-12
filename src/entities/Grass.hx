package entities;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.graphics.Image;

import util.Rand;

/**
 * ...
 * @author Bjorn
 */
@:final
class Grass extends Entity {

	public function new(x:Float = 0, y:Float = 0, mask:Mask = null) {

		var graphic:Image;
		if (Math.random() < 0.3) {
			graphic = new Image("graphics/grass2.png");
		} else {
			graphic = new Image("graphics/grass.png");
		}

		super(x, y, graphic/*, mask*/);
	}

	public override function update()
	{
		//if (Math.random() < 0.8) { return; }
		//moveBy(Rand.randInt(-2, 3), Rand.randInt(-2, 3));
		super.update();
	}
}