package samples.loader;

import pixi.loaders.Loader;
import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	var _loader:Loader;
	var _img:Sprite;
	var _baseURL:String;

	public function new() {
		super();
		_init();
	}

	function _init() {
		super.start();
		_baseURL = "assets/loader/";

		_loader = new Loader();
		_loader.baseUrl = _baseURL;

		for (i in 1 ... 10) _loader.add("img" + i, i + ".png");
		_loader.on("complete", _onLoaded);
		_loader.on("progress", _onLoadProgress);
		_loader.load();
	}

	function _onLoadProgress() {
		trace("Loaded: " + Math.round(_loader.progress));
	}

	function _onLoaded() {
		var _container:Container = new Container();
		_stage.addChild(_container);
		for (i in 1 ... 11) {
			_img = new Sprite(Texture.fromImage(_baseURL + i + ".png"));
			_img.name = "img" + i;
			if (i < 5) _img.position.set(_img.width * i, 0);
			else _img.position.set(_img.width * (i - 5), _img.height);
			_container.addChild(_img);
		}
		_container.position.set((Browser.window.innerWidth - _container.width) / 2, (Browser.window.innerHeight - _container.height) / 2);
	}

	static function main() {
		new Main();
	}
}