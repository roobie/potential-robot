package util;

class Rand {

	public static function randInt(min:Int, max:Int): Int {
		return 0 + min +
			(Math.floor(Math.random() *
                 (Math.floor(Math.abs(min)) + max)));
	}
}
