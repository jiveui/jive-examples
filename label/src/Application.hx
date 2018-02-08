package ;

import view.MainWindow;
import viewmodel.MainViewModel;
import jive.*;

class Application {
    public static function main() {
        Jive.init();
        var w: MainWindow = new MainWindow();
        w.dataContext = new MainViewModel();
        w.show();

    }
}
