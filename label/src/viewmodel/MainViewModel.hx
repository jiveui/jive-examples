package viewmodel;

import openfl.Lib;
import jive.Font;

@:bindable
class MainViewModel extends jive.ViewModel {
	public var font1: Font;


    public function new() {
        super();

        // font1 = new Font("assets/Lobster-Regular.ttf", 30);
    }

}
