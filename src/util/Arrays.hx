package util;

class Arrays {

	public static
  function partition<T>(ary:Array<T>, partCount:Int): Array<Array<T>> {
		var result:Array<Array<T>> = [];
    var partLen = Math.ceil(ary.length / partCount);
    for (n in 0...partCount) {
      var start = n * partLen;
      var end = start + partLen;
      result.push(ary.slice(start, end));
    }

    return result;
	}
}
