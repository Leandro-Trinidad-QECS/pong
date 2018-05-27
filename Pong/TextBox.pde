class textBox {
  float x;
  float y;
  float sizeX;
  float sizeY;
  color col;
  color c;
  textBox(float x, float y, float sizeX, float sizeY, color c) {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.x = x;
    this.y = y;
    this.c = c;
  }

  boolean hitBox(float mousex, float mousey, color col) {
    if (pointRect(int(mousex), int(mousey), int(this.x), int(this.y), int(this.sizeX), int(this.sizeY))) {
      this.col = col;
      if (mousePressed) {
        return true;
      }
    } else {
      this.col = c;
    }
    return false;
  }
  void display(String word,int size,color colo) {
    pushMatrix();
    rectMode(CENTER);
    fill(col);
    rect(x, y, sizeX, sizeY);
    textSize(size);
    textAlign(CENTER,CENTER);
    fill(colo);
    text(word,x,y);
    popMatrix();
  }
}
