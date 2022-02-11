package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import LeftH;

class PlayState extends FlxState
{
	var LeftB:LeftH = new LeftH(1.5);
	var RightB:LeftH = new LeftH(1.5);
	override public function create()
	{
		super.create();
		add(LeftB);
		add(RightB);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
