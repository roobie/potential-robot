package entities;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.masks.Polygon;
import com.haxepunk.graphics.Image;

import util.Pos;
import util.Rand;

/**
 * ...
 * @author Bjorn
 */
@:final
class Actor extends Entity {

	public function new(p:Pos, mask:Mask = null) {

		var graphic:Image;
		//graphic = new Image("graphics/dude_1.png");
		var sides = 5;
		var radius = 8;
		var pg = Polygon.createPolygon(sides, radius, 360/sides);
		graphic = Image.createPolygon(pg, Rand.randInt(0, 0xffffff), 0.7, true, 3);

		super(p.x, p.y, graphic/*, mask*/);
	}

	// public override function update()
	// {
	// 	super.update();
	// }
}
