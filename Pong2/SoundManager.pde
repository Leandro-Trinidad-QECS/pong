import ddf.minim.*;
class soundManager {
  String[] soundnames;


  soundManager(String[] filenames) {
    this.soundnames = filenames;
  }

  void play() {
    player = minim.loadFile( soundnames[ (int) random(soundnames.length-1) ] );

    player.play();
  }
}
