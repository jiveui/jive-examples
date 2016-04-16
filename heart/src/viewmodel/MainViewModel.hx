package viewmodel;

import haxe.Timer;
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

    public var rotation: Float;

    public function new() {
        super();
        run();
    }

    private function run() {

        var stageW: Int = Std.int(Lib.current.stage.stageWidth);

        rectSize = 300;

        rectX =  0;
        rectY =  150;

        strokeColor = Color.LIGHT_GRAY.toSvg();

        radius = 150;

        circle1X = circle2X = Std.int(rectX + rectSize/2);
        circle1Y = circle2Y = Std.int(rectY + rectSize/2);

        rotation = 0.0;

        moveCirclesToCorners();
    }

    private function moveCirclesToCorners() {
        Actuate.tween(this, 1, {
                circle1X: Std.int(rectX + rectSize/2),
                circle1Y: Std.int(rectY),
                circle2X: Std.int(rectX + rectSize),
                circle2Y: Std.int(rectY + rectSize/2)
            })
            .ease(Linear.easeNone)
            .onComplete(function() {
                rotate();
            });
    }

    private function rotate() {
        Actuate.tween(this, 1, {
            rotation: -45
        })
        .ease(Linear.easeNone)
        .onComplete(function() {
            Timer.delay(function() { run(); }, 2000);
        });
    }
}
