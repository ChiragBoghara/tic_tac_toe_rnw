class GameData {
  int player1;
  int player2;
  String side1;
  String side2;
  bool isAi;
  GameData({this.player1, this.player2, this.side1, this.side2, this.isAi});
  void increaseP1() {
    player1 += 1;
  }

  void increaseP2() {
    player2 += 1;
  }

  String getSide1() {
    return side1;
  }

  String getSide2() {
    return side2;
  }

  int getP1() {
    return player1;
  }

  int getP2() {
    return player2;
  }
}
