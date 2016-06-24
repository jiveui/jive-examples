package ;

import openfl.events.Event;
import openfl.Lib;
import view.MainWindow;
import viewmodel.MainViewModel;
import jive.*;
import jive.geom.*;

class Application {
    public function new() {
        Jive.start();
        var w: MainWindow = new MainWindow();
        w.dataContext = new MainViewModel();
        w.opened = true;

        Lib.current.stage.addEventListener(Event.RESIZE, function(e) {
            w.width = Metric.absolute(Std.int(Lib.current.stage.stageWidth));
            w.height = Metric.absolute(Std.int(Lib.current.stage.stageHeight));
        });
    }
}
