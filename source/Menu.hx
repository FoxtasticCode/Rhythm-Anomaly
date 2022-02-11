package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class Menu extends FlxState
{
	var PlayB:FlxButton = new FlxButton(0, 360, "", function(){
		FlxG.switchState(new SongSelection());
	});
	var PlayT:FlxText = new FlxText(0, 380, "PLAY", 32);
	override public function create()
	{
		super.create();
		add(PlayB);
		PlayB.loadGraphic("assets/images/Arrow.png", true, 400, 100);
		PlayT.setFormat("assets/fonts/Main.tff", 32, FlxColor.BLACK);
		add(PlayT);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
