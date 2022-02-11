package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import Hitnote;
import sys.io.File;
import sys.FileSystem;
import SongSelection;
import haxe.Json;
import Xml;
import haxe.format.JsonParser;
import Hitnote;

typedef NoteData = {
  var time:Float;
  var row:Float;
}

class SongPlay extends FlxState
{
  public static var CurSong:String;
  public static var Tick:FlxSprite;
  var posText:FlxText = new FlxText(FlxG.width/2, 40, "VAR MOUSEPOS NOT FOUND");
  var curSongFolder:String = "assets/data/songs/" + SongSelection.CurSong;
  var noteXMLPath:String = File.getContent("assets/data/songs/" + SongSelection.CurSong + "/notes.xml");
  var noteData:Xml;
  var songXMLPath:String = File.getContent("assets/data/songs/" + SongSelection.CurSong + "/data.xml");
  var songData:Xml;
  override public function create()
  {
    noteData = Xml.parse(noteXMLPath).firstElement();
    songData = Xml.parse(songXMLPath).firstElement();
    super.create();
    FlxG.sound.playMusic("assets/data/songs/" + SongSelection.CurSong + "/audio.mp3");
    var Title:FlxText = new FlxText(120, 10, songData.get("title"));
    var Artist:FlxText = new FlxText(120, 35, songData.get("artist"));
    var BPM:FlxText = new FlxText(120, 60, songData.get("bpm"));
    var BG:FlxSprite = new FlxSprite(0, 0);
    if (FileSystem.exists("assets/data/songs/" + SongSelection.CurSong + "/bg.png")) {
      BG.loadGraphic("assets/data/songs/" + SongSelection.CurSong + "/bg.png");
    }else if(FileSystem.exists("assets/data/songs/" + SongSelection.CurSong + "/bg.jpg")){
      BG.loadGraphic("assets/data/songs/" + SongSelection.CurSong + "/bg.jpg");
    }else {
      BG.makeGraphic(1280, 720, FlxColor.WHITE);
    }

    for (note in noteData.elements())
    {
      var __thisrow = Std.parseInt(note.get("row"));
      var __thistime = Std.parseFloat(note.get("time"));
      var __thisoffset = 0;
      if (note.exists("offset"))
      {
        __thisoffset = Std.parseInt(note.get("offset"));
      }else{
        __thisoffset = 0;
      }

      function spawnnote(timer:FlxTimer):Void
      {
        var __thisnote:Hitnote = new Hitnote(__thisrow, 1, __thisoffset);
        add(__thisnote);
      }

      new FlxTimer().start(__thistime, spawnnote, 1);
    }

    Title.setFormat(null, 24);
    Artist.setFormat(null, 18);
    BPM.setFormat(null, 14);
    var Jacket:FlxSprite = new FlxSprite(10, 10, "assets/data/songs/" + SongSelection.CurSong + "/jacket.png");
    Jacket.setGraphicSize(100, 100);
    Jacket.updateHitbox();
    trace(SongSelection.CurSong);
    var Track:FlxSprite = new FlxSprite();
    Tick = new FlxSprite();
    FlxG.camera.fade(FlxColor.BLACK, 0.5, true);
    Track.loadGraphic("assets/images/track.png");
    Tick.loadGraphic("assets/images/tick.png");
    add(Track);
    add(Tick);
    Tick.screenCenter();
    Tick.y += 185;
    Tick.x -= 25;
    Track.screenCenter();
    add(Jacket);
    add(Title);
    add(Artist);
    add(BPM);
    add(posText);
  }

  override public function update(elapsed:Float)
  {
    super.update(elapsed);
    posText.text = FlxG.mouse.x + ", " + FlxG.mouse.y;

    if (FlxG.keys.justPressed.T)
    {
      FlxG.switchState(new SongPlay());
    }else if(FlxG.keys.justPressed.R){
      FlxG.switchState(new SongSelection());
      FlxG.sound.music.pause();
    }
  }
}
