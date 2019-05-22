class BoardManager {

  // 0 = no user, 1 = X, 2 = O
  private int[][] board = {
    {0, 0, 0}, 
    {0, 0, 0}, 
    {0, 0, 0}};


  BoardManager() {
  }
  
  void printTest() {
    for(int[] row: board) {
      for(int col: row) {
        print(col);
      }
      println();
    }
  }
  // precondition player can only be 1 or 0
  void place(int player,int row, int col) {
    this.board[row][col] = player;
  }

  Boolean isEmpty(int row, int col) {
    //Checks it the spot is empty
    return this.board[row][col] == 0;
  }
  int whoseSpot(int row, int col) {
    //returns the number of the spot
    return this.board[row][col];
  }
  Boolean isWin(int player) { // 1 or 2

    // if player has all spots that makes a win it returns true else false
    return ((this.board[0][0] == player && this.board[0][1] == player && this.board[0][2] == player) ||
      (this.board[1][0] == player && this.board[1][1] == player && this.board[1][2] == player) ||
      (this.board[2][0] == player && this.board[2][1] == player && this.board[2][2] == player) ||
      (this.board[0][0] == player && this.board[1][0] == player && this.board[2][0] == player) ||
      (this.board[0][1] == player && this.board[1][1] == player && this.board[2][1] == player) ||
      (this.board[0][2] == player && this.board[1][2] == player && this.board[2][2] == player) ||
      (this.board[0][0] == player && this.board[1][1] == player && this.board[2][2] == player) ||
      (this.board[0][2] == player && this.board[1][1] == player && this.board[2][0] == player) ) ? true : false;
  }

  int[][] getBoard() {
    return this.board;
  }
  
  
}
