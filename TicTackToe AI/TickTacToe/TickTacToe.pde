
BoardManager boardManager;
SceneManager sceneManager;
ButtonManager buttonManager;
void setup() {
  size(500, 500);

  boardManager = new BoardManager();
  sceneManager = new SceneManager(0);
  buttonManager = new ButtonManager();
}

void draw() {
  
  //Moves between the scenes
  switch(sceneManager.getScene()) {
  case 0:
    lobby(); // TODO: whats the other names for it?????!
    break;
  case 1:
    options();
    break;
  case 2:
    onePlayer();
    break;
  case 3:
    twoPlayer();
    break;
  }
}

void lobby() {
  
}

void options() {
}

void onePlayer() {
}

void twoPlayer() {
}
