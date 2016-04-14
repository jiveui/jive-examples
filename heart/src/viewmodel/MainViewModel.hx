package viewmodel;

import motion.easing.Linear;
import motion.Actuate;
import jive.Color;
import openfl.Lib;
@:bindable
class MainViewModel extends jive.ViewModel {
    public var radius: Null<Int>;

    public var circle1X: Null<Int>;
    public var circle1Y: Null<Int>;

    public var circle2X: Null<Int>;
    public var circle2Y: Null<Int>;

    public var rectX: Null<Int>;
    public var rectY: Null<Int>;
    public var rectSize: Null<Int>;

    public var strokeColor: String;

    public function new() {
        super();

        var stageW: Int = Std.int(Lib.current.stage.stageWidth);

        radius = Std.int(stageW / 8);
        rectSize = Std.int(stageW / 4);

        rectX =  Std.int(stageW/2);
        rectY =  Std.int(Lib.current.stage.stageHeight/2 - rectSize);

        circle1X = circle2X = Std.int(rectX + rectSize/2);
        circle1Y = circle2Y = Std.int(rectY + rectSize/2);

        strokeColor = Color.GRAY.toSvg();
    }

    private function moveCirclesToCorners() {
        Actuate.tween(this, 1, {
            circle1X: rectX + rectSize,
            circle1Y: rectY,
            circle2X: rectX + rectSize,
            circle2Y: rectY + rectSize
        }).ease(Linear.easeNone);
    }
}
