package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUI;

class EditorState extends FlxUIState
{
    var _map:FlxUI;
    override public function create():Void
    {
        _xml_id = "main";
        super.create();
        _map = cast _ui.getAsset("prueba");
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
