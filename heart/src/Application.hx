package ;

import view.MainWindow;
import viewmodel.MainViewModel;
import jive.*;

class Application {
    public function new() {
        Jive.start();
        var w: MainWindow = new MainWindow();
        w.dataContext = new MainViewModel();
        w.opened = true;
    }
}
