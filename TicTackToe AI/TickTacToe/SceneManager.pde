class SceneManager {
  int scene = 0;
  SceneManager(int initScene) {

    this.scene = initScene;
  }

  int getScene() {
    return this.scene;
  }

  void incrementScene() {
    this.scene ++;
  }
  void decreaseScene() {
    this.scene--;
  }
  
  void switchScene(int scene) {
    this.scene = scene;
  }
  
  //Add transition for switching scenes like a fade out
  
  
}
