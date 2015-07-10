package;

import firetongue.FireTongue;
import firetongue.Replace;

class Locale
{
    public static var tongue:FireTongue = null;

    public static function init(lang:String, finished:Dynamic):Void {
        tongue = new FireTongue();
        tongue.init(lang, finished);
    }
}
