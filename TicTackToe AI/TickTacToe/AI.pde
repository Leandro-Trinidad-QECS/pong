class AI {
  BoardManager board;

  int id;
  int opponentId;


  AI(BoardManager board, int id) {
    this.board = board;
    this.id = id;

    this.opponentId = (id==1) ? 2 : 1; //gets opponent id
  }
  
  void AIMoves() {
    //AI's moves
  }
  // first moves
  int[] corner() {
    int[][] cornerMoves = {{0,0},{0,2},{2,0},{2,2}};
    //return cornerMoves[0];
  }

  // returns the coords of the spot that would make the AI Win
  int[] win() {
    int[][] duplicateBoard = this.board.getBoard();
    for (int row = 0; row < duplicateBoard.length; row ++) {
      for ( int col = 0; col < duplicateBoard[0].length; col ++) {
        duplicateBoard = this.board.getBoard();
        if (this.board.isEmpty(row, col, duplicateBoard)) {
          duplicateBoard[row][col] = id;
          if (this.board.isWin(id, duplicateBoard)) {
            return new int[]{row, col};
          }
        }
      }
    }
    return null;
  }
  //returns row and col of opponent coords that would make them win
  int[] block() {
    int[][] duplicateBoard = this.board.getBoard();
    for (int row = 0; row < duplicateBoard.length; row++) {
      for (int col = 0; col < duplicateBoard[0].length; col++) {
        duplicateBoard = this.board.getBoard();
        if (this.board.isEmpty(row, col, duplicateBoard)) {
          duplicateBoard[row][col] = this.opponentId;
          if (this.board.isWin(this.opponentId, duplicateBoard)) {
            return new int[]{row, col};
          }
        }
      }
    }
    return null;
  }
  
  int[] center() {
    int[][] cornerMoves = {{0,0},{0,2},{2,0},{2,2}}; // moves that the opponenent takes 
    for(int[] coords: cornerMoves) {
      if((this.board.whoseSpot(coords[0],coords[1],this.board.getBoard())) == this.opponentId) {
        return new int[]{1,1}; // this is the center
      }
    }
  }
}
