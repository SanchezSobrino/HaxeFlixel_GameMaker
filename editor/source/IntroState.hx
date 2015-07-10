package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxDestroyUtil;

import Locale;

class IntroState extends FlxState
{
    private var _btnNewProject:FlxButton;
    private var _btnOpenProject:FlxButton;

    override public function create():Void
    {
        _btnNewProject = new FlxButton(0, 0, Locale.tongue.get("$NEW_PROJECT"), clickNewProject);
        _btnNewProject.x = (FlxG.width / 3) - _btnNewProject.width - 10;
        _btnNewProject.y = FlxG.height - _btnNewProject.height - 10;
        add(_btnNewProject);

        _btnOpenProject = new FlxButton(0, 0, Locale.tongue.get("$OPEN_PROJECT"), clickOpenProject);
        _btnOpenProject.x = (FlxG.width / 1.5) - _btnOpenProject.width - 10;
        _btnOpenProject.y = FlxG.height - _btnOpenProject.height - 10;
        add(_btnOpenProject);

        super.create();
    }

    override public function destroy():Void
    {
        super.destroy();

        _btnNewProject = FlxDestroyUtil.destroy(_btnNewProject);
        _btnOpenProject = FlxDestroyUtil.destroy(_btnOpenProject);
    }

    override public function update():Void
    {
        super.update();
    }

    private function clickNewProject():Void
    {
        trace("btnNewProject clicked.");
        trace(Locale.tongue.get("$NEW_PROJECT"));
    }

    private function clickOpenProject():Void
    {
        trace("btnOpenProject clicked.");
        trace(Locale.tongue.get("$OPEN_PROJECT"));
    }
}
