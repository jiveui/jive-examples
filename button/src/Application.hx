package ;

import openfl.events.Event;
import openfl.Lib;
import view.MainWindow;
import viewmodel.MainViewModel;
import jive.*;


class Application {
    public static function main() {
        Jive.init();
        var w: MainWindow = new MainWindow();
        w.dataContext = new MainViewModel();
        w.show();

        Lib.current.stage.addEventListener(Event.RESIZE, function(e) {
            w.width = Std.int(Lib.current.stage.stageWidth);
            w.height = Std.int(Lib.current.stage.stageHeight);
        });
    }
}
