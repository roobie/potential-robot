package util;

@:final
class Pos {

  public var x(default, null):Float;
  public var y(default, null):Float;

  public function new(x, y: Float) {
    this.x = x;
    this.y = y;
  }
}
