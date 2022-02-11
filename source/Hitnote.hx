package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import SongPlay;
import motion.Actuate;
import flixel.effects.particles.FlxEmitter;
import flixel.util.FlxColor;
import flixel.effects.particles.FlxParticle;
import HitAnimation;

class Hitnote extends FlxSprite
{
  var _thisrow:Int;
  var _thisnotespeed:Int;
  var __Sprite:FlxSprite = new FlxSprite(0, 0);
  var emitter:FlxEmitter;
  public function new(row:Int, notespeed:Int = 2, offset:Float = 0)
  {
    _thisrow = row;
    _thisnotespeed = notespeed;
    super(row, notespeed);
    if (row == 1)
    {
      x = 557;
      y = 85 + offset;
      velocity.x = -20.5;
      velocity.y = 400;
    }
    if (row == 2)
    {
      x = 582;
      y = 85 + offset;
      velocity.x = -5.1;
      velocity.y = 400;
    }
    if (row == 3)
    {
      x = 615;
      y = 85 + offset;
      velocity.x = 5;
      velocity.y = 400;
    }
    if (row == 4)
    {
      x = 645;
      y = 85 + offset;
      velocity.x = 20;
      velocity.y = 400;
    }

    loadGraphic("assets/images/button.png");
    setGraphicSize(35, 10);
    updateHitbox();
  }

    override public function update(elapsed:Float)
    {
      super.update(elapsed);
      if (_thisrow == 1)
      {
        if (FlxG.keys.justPressed.D && y>475 && y<585)
        {
          var __thisHIT:HitAnimation = new HitAnimation();
          __thisHIT.Play(_thisrow);
          destroy();
        }
      }
      if (_thisrow == 2)
      {
        if (FlxG.keys.justPressed.F && y>475 && y<585)
        {
          var __thisHIT:HitAnimation = new HitAnimation();
          __thisHIT.Play(_thisrow);
          destroy();
        }
      }
      if (_thisrow == 3)
      {
        if (FlxG.keys.justPressed.J && y>475 && y<585)
        {
          var __thisHIT:HitAnimation = new HitAnimation();
          __thisHIT.Play(_thisrow);
          destroy();
        }
      }
      if (_thisrow == 4)
      {
        if (FlxG.keys.justPressed.K && y>475 && y<585)
        {
          var __thisHIT:HitAnimation = new HitAnimation();
          __thisHIT.Play(_thisrow);
          destroy();
        }
      }
    }
}
