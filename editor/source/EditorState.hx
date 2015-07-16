package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUI;

class EditorState extends FlxUIState
{
    // Speed of the movement around the map
    private static inline var CAM_VELOCITY = 400;
    // Elements of the UI
    var _map:FlxUI;
    var _left_panel:FlxUI;
    var _clicked_position:FlxPoint;
    var _mouse_active:Bool;


    override public function create():Void
    {
        _xml_id = "main";
        super.create();
        _map = cast _ui.getAsset("map");
        _left_panel = cast _ui.getAsset("left_background");
        _clicked_position = new FlxPoint();
        _mouse_active = false;
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update():Void
    {
        super.update();
        // mouse controls
        if (FlxG.mouse.justPressed){
            if (FlxG.mouse.x > 100 && FlxG.mouse.x < (FlxG.width - 100)){
                _mouse_active = true;
                _clicked_position = FlxG.mouse.getScreenPosition();
            }
        }
        if (FlxG.mouse.pressed){
            if (FlxG.mouse.x > 100 && FlxG.mouse.x < (FlxG.width - 100) && _mouse_active){
                var _differenceX:Float = (FlxG.mouse.x - _clicked_position.x) * _map.scale.x;
                var _differenceY:Float = - (FlxG.mouse.y - _clicked_position.y) * _map.scale.y;
                _map.x += _differenceX;
                _map.y -= _differenceY;
                _clicked_position = FlxG.mouse.getScreenPosition();
            }
        }
        if (FlxG.mouse.justReleased){
            _mouse_active = false;
        }
        // keyboard controls
        if (FlxG.keys.pressed.A){
            moveMapRight();
        }
        if (FlxG.keys.pressed.D){
            moveMapLeft();
        }
        if (FlxG.keys.pressed.S){
            moveMapUp();
        }
        if (FlxG.keys.pressed.W){
            moveMapDown();
        }

        checkMapPosition();
    }

    private function moveMapLeft():Void{
        _map.x -= CAM_VELOCITY*FlxG.elapsed;
    }

    private function moveMapRight():Void{
        _map.x += CAM_VELOCITY*FlxG.elapsed;
    }

    private function moveMapUp():Void{
        _map.y -= CAM_VELOCITY*FlxG.elapsed;
    }

    private function moveMapDown():Void{
        _map.y += CAM_VELOCITY*FlxG.elapsed;
    }

    private function checkMapPosition():Void{
        if (_map.y > 0){
            _map.y = 0;
        }
        if (_map.y < - (_map.height - FlxG.height)){
            _map.y = - (_map.height - FlxG.height);
        }
        if (_map.x > 100){
             _map.x = 100;
        }
        if(_map.x < - (_map.width + 100 - FlxG.width)){
            _map.x = - (_map.width + 100 - FlxG.width);
        }
    }
}
