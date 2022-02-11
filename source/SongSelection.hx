package;

import motion.Actuate;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import haxe.Json;
import haxe.format.JsonParser;
import lime.utils.Assets;
import sys.io.File;
import sys.FileSystem;
import neko.NativeXml;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.effects.particles.FlxEmitter;
import flixel.util.FlxTimer;

using StringTools;

class SongSelection extends FlxState
{
  public static var CurSong:String;
  var BG:FlxSprite = new FlxSprite(0, 0, "assets/images/Songsele.png");
  var Jacket:FlxSprite;
  var Title:FlxText = new FlxText(900, 375, "Select a song", 32);
  var Artist:FlxText = new FlxText(900, 415, "", 22);
  var BPM:FlxText = new FlxText(900, 445, "", 14);
  var JacketP:FlxSprite = new FlxSprite(490, 50);
  var TitleP:FlxText = new FlxText(490, 375, "Select a song", 32);
  var ArtistP:FlxText = new FlxText(490, 415, "", 22);
  var BPMP:FlxText = new FlxText(490, 445, "", 14);
  var songpos:Float = 1;
  var StorySongs = [
    "BADTEK",
    "ISPY",
    "SINGULARITY",
    "six-six-six"
  ];

  override public function create()
  {
    super.create();
    var Particles:FlxEmitter = new FlxEmitter(1050, 200, 10);
    Particles.emitting = true;
    var Window:FlxSprite = new FlxSprite(0, 0, "assets/images/Window.png");
    var SPress:Int = 0;
    Jacket = new FlxSprite(900, 50);
    Jacket.loadGraphic("assets/images/loading.png");
    Jacket.setGraphicSize(300, 300);
    Jacket.updateHitbox();
    for (song in sys.FileSystem.readDirectory("assets/data/songs"))
    {
      var songText:FlxButton;
      var songXMLPath:String = File.getContent("assets/data/songs/" + song + "/data.xml");
      var START:FlxButton;
      var songData:Xml;
      songData = Xml.parse(songXMLPath).firstElement();
      var songName:String = songData.get("title");
      var PreviewText = new FlxText(0, 110 * songpos + 19.25, songData.get("title"));
      songText = new FlxButton(0, 110 * songpos, "", function(){
        Jacket.loadGraphic("assets/data/songs/" + song + "/jacket.png");
        Jacket.setGraphicSize(300, 300);
        Jacket.updateHitbox();
        Title.text = songData.get("title");
        Artist.text = songData.get("artist");
        BPM.text = songData.get("bpm");
        FlxG.sound.playMusic("assets/data/songs/" + song + "/audio.mp3");
        JacketP.loadGraphic("assets/data/songs/" + song + "/jacket.png");
        JacketP.setGraphicSize(300, 300);
        JacketP.updateHitbox();
        TitleP.text = songData.get("title");
        ArtistP.text = songData.get("artist");
        BPMP.text = songData.get("bpm");
        trace(songData.get("artist"));
        trace(songData.get("title"));
        trace("assets/data/songs/" + song + "/audio.mp3");
        //songText.loadGraphic("assets/images/ArrowClicked.png", true, 400, 100);
      });
      PreviewText.setFormat("assets/fonts/Main.ttf", 42, FlxColor.BLACK);
      Title.setFormat("assets/fonts/Texts.tff", 32);
      Artist.setFormat("assets/fonts/Texts.tff", 22);
      BPM.setFormat("assets/fonts/Texts.tff", 18);
      add(JacketP);
      add(TitleP);
      add(ArtistP);
      add(BPMP);
      add(BG);
      add(Title);
      add(Artist);
      add(BPM);
      add(songText);
      songText.loadGraphic("assets/images/Arrow.png", true, 400, 100);
      add(Jacket);
      add(PreviewText);
      add(Particles);
      songpos += 1;
      function JumptoNotes(timer:FlxTimer):Void
      {
        FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function()
        {
          FlxG.switchState(new SongPlay());
          FlxG.sound.music.pause();
          CurSong = Title.text;
        });
      }
      START = new FlxButton(920, 550, "", function()
      {
        Actuate.tween (Jacket, 3, {x:1400});
        Actuate.tween (Title, 3, {x:1400});
        Actuate.tween (Artist, 3, {x:1400});
        Actuate.tween (BPM, 3, {x:1400});
        Actuate.tween (songText, 3, {x:-500});
        Actuate.tween (PreviewText, 3, {x:-500});
        Actuate.tween (START, 3, {x:1400});
        Actuate.tween (BG, 3, {y:-730});
        new FlxTimer().start(5, JumptoNotes, 1);
        CurSong = Title.text;
      });
      add(START);
      START.loadGraphic("assets/images/START.png", true, 256, 106);
    }
  }

  override public function update(elapsed:Float)
  {
    super.update(elapsed);
  }
}
