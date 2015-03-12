package pixi.core.utils;

@:native("PIXI.utils")
extern class Utils {

	/**
     * get the resolution of an asset by looking for the prefix
     * used by spritesheets and image urls
     *
     * @param url {String} the image path
     * @return {Float}
     */
	static function getResolutionOfUrl(url:String):Float;
}