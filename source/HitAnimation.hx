package;

import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;


class HitAnimation extends FlxEmitter
{
  public function new()
  {
    super();
  }

  public function Play(row:Int)
  {
    if (row==1)
    {
      x = 550;
      y = 550;
      for (i in 0 ... 50)
      {
    	  var p = new FlxParticle();
        p.makeGraphic(2, 2, 0xFFFFFFFF);
        p.exists = true;
        add(p);
      }

      start(false, 1, 40);
    }
    if (row==2)
    {
      x = 595;
      y = 550;
      for (i in 0 ... 40)
      {
    	  var p = new FlxParticle();
        p.makeGraphic(2, 2, 0xFFFFFFFF);
        p.exists = true;
        add(p);
      }

      start(false, 1, 40);
    }
    if (row==3)
    {
      x = 635;
      y = 550;
      for (i in 0 ... 40)
      {
    	  var p = new FlxParticle();
        p.makeGraphic(2, 2, 0xFFFFFFFF);
        p.exists = true;
        add(p);
      }

      start(false, 1, 40);
    }
    if (row==4)
    {
      x = 685;
      y = 550;
      for (i in 0 ... 40)
      {
    	  var p = new FlxParticle();
        p.makeGraphic(2, 2, 0xFFFFFFFF);
        p.exists = true;
        add(p);
      }

      start(false, 1, 40);
    }

  }
}
