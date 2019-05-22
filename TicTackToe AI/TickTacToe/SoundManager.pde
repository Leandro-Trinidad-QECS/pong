import ddf.minim.*;
class soundManager {
  Minim minim;
  AudioPlayer player;
  String[] soundnames;


  soundManager(String[] filenames) {
    this.soundnames = filenames; // list of the sound
  }

  void playRandom() {
    //plays the sound
    player = minim.loadFile( soundnames[ (int) random(soundnames.length-1) ] );
    player.play();
  }

  void playSpecific(int point) {
    player = minim.loadFile(soundnames[point]);
    player.play();
  }
}
