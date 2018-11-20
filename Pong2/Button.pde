class Button {
  float x, y, w, h;
  String word;
  boolean active;
  int wordLength;
  int textsize = 50;
  Button(float  x, float y, float w, float h, String word) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.word = word;
    this.wordLength = word.length();
  }
  //run update first then do display
  void show() {
    float boxwidth =(sq(textsize)*(this.wordLength))/this.h*2;
    
    print(boxwidth + "\n");
    active = true;
    
    fill(255);
    textFont(JustMyType50);
    textSize(50);
    textAlign(CENTER, CENTER);
    rect(this.x,this.y,boxwidth,this.h);
    textSize(textsize);
    fill(0);
    text(this.word, this.x, this.y,this.w,this.h);
  }

  boolean isActive() {
    return active;
  }

  boolean isHover() {
    return mouseX >= this.x-this.w/2 && mouseX <= this.x+this.w/2 && mouseY >= this.y-this.h/2 && mouseY <= this.y + this.h/2;
  }
}
