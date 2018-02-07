package viewmodel;

import openfl.Lib;

@:bindable
class MainViewModel implements bindx.IBindable {

    public var buttonCommand: jive.Command;

    public function new() {
        buttonCommand = new jive.BaseCommand(function() { trace("Click!"); });
    }

}
