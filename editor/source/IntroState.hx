package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxDestroyUtil;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUITypedButton;

class IntroState extends FlxUIState
{
    override public function create():Void
    {
        _xml_id = Type.getClassName(Type.getClass(this));
        super.create();
    }

    public override function getEvent(id:String, sender:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void
    {
        if (id == FlxUITypedButton.CLICK_EVENT) {
            if (params != null && params.length > 0) {
                var methodName:String = cast(params[0], String);
                var method:Dynamic = Reflect.field(this, methodName);
                if (method != null) {
                    Reflect.callMethod(this, method, [params]);
                }
                else {
                    trace("Method '" + methodName + "' not found!");
                }
            }
        }
    }

    private function onClickNewProject(?params:Array<Dynamic>):Void
    {
        var arg1:Int = cast(params[1], Int);
        trace("btnNewProject clicked: " + arg1);
        FlxG.switchState(new EditorState());
    }

    private function onClickOpenProject(?params:Array<Dynamic>):Void
    {
        trace("btnOpenProject clicked.");
    }
}
