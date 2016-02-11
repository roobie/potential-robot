package areas;

import com.haxepunk.Graphic.TileType;
import com.haxepunk.graphics.Tilemap;
import com.haxepunk.HXP;
import man.HxMidpointDisplacement;
import man.HxValueNoise;

using man.HxWorleyNoise.DistanceCalculator;

/**
 * ...
 * @author Bjorn
 */
@:final
class SimpleArea extends Tilemap{
	private var worleyMap:Array<Array<Int>>;
	private var valueMap:Array<Array<Int>>;

	public function new() {

		var tileset = "graphics/grass_8x1.png";
		var width = Math.floor(HXP.stage.width);
		var height = Math.floor(HXP.stage.height);
		var tileWidth = 8;
		var tileHeight = 8;
		super(tileset, width, height, tileWidth, tileHeight);

		var numLevels = 8;
		var persistence = 0.525;
		valueMap = HxValueNoise.generateIntMatrix(this.columns, this.rows, numLevels, persistence, numLevels);

		//valueMap = HxMidpointDisplacement.generateIntMatrix(this.columns, this.rows, 0.65, numLevels);

		var array = valueMap;
		for (y in 0...array.length)
		{
			for (x in 0...array[0].length)
			{
				var value:Int = array[y][x];


				//if (value == 1) {
				//	setTile(x, y, 1);
				//} else {
				//	setTile(x, y, 0);
				//}

				setTile(x, y, value);

			}
		}
	}

}