package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

class IntroState extends FlxState
{
    override public function create():Void
    {
        add(new FlxText(0, 0, 100, "Hello World!"));
        super.create();
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update():Void
    {
        super.update();
    }
}
