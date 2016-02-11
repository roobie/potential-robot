package logic;
import com.haxepunk.Entity;

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
		e.moveBy(1, 1);
	}

}