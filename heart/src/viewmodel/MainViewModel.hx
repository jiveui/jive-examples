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
    public var rotation: Null<Float>;
    public var rectAlpha: Null<Float>;
    public var circleAlpha: Null<Float>;

    public var heartX: Null<Int>;
    public var heartY: Null<Int>;

    public var heartAlpha: Null<Float>;
    public var heartBorderAlpha: Null<Float>;

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

        rectAlpha = 0.0;
        circleAlpha = 0.0;

        heartAlpha = 0.0;
        heartBorderAlpha = 0.0;

        showRect();
    }

    private function showRect() {
        Actuate.tween(this, 1, {
            rectAlpha: 1.0
        })
        .ease(Linear.easeNone)
        .onComplete(function() {
            showCircles();
        });
    }

    private function showCircles() {
        Actuate.tween(this, 1, {
            circleAlpha: 1.0
        })
        .ease(Linear.easeNone)
        .onComplete(function() {
            moveCirclesToCorners();
        });
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
            showHeartBorder();
        });
    }

    private function hideRectAndCircles() {
        Actuate.tween(this, 1, {
            rectAlpha: 0.0,
            circleAlpha: 0.0
        })
        .ease(Linear.easeNone)
        .onComplete(function() {
            Timer.delay(function() { showHeart(); }, 1000);
        });
    }

    private function showHeartBorder() {
        Actuate.tween(this, 1, {
            heartBorderAlpha: 1.0
        })
        .ease(Linear.easeNone)
        .onComplete(function() {
            Timer.delay(function() { hideRectAndCircles(); }, 1000);
        });
    }

    private function showHeart() {
        Actuate.tween(this, 1, {
            heartAlpha: 1.0
        })
        .ease(Linear.easeNone)
        .onComplete(function() {
            Timer.delay(function() { run(); }, 2000);
        });
    }
}
