class Button {
  float x, y, w, h;
  String word;
  boolean active;
  int wordLength;
  int textsize = 50;
  float boxwidth;
  boolean pressed;
  boolean pressHold;
  Button(float  x, float y, float w, float h, String word) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = 55;
    this.word = word;
    this.wordLength = word.length();
    this.boxwidth =(sq(textsize)*(this.wordLength))/150;
  }
  //run update first then do display
  void show() {
    active = true;

    if (isHover()) {
      fill(255);
      rectMode(CENTER);
      rect(this.x, this.y, this.boxwidth, this.h);
      fill(0);
    } else {
      fill(255);
    }
    textFont(JustMyType50);
    textSize(50);
    textAlign(CENTER, CENTER);
    textSize(textsize);
    text(this.word, this.x, this.y);
  }

  boolean isActive() {
    return active;
  }

  boolean isHover() {
    return mouseX >= this.x-this.boxwidth/2 && mouseX <= this.x+this.boxwidth/2 && mouseY >= this.y-this.h/2 && mouseY <= this.y + this.h/2;
  }
  boolean isPressed() {
    if (isHover() && mousePressed) {
      return true;
    } else {
      return false;
    }
  }
}
