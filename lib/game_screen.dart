import 'package:flutter/material.dart';
import 'package:tic_tac_toe_rnw/components.dart';
import 'package:tic_tac_toe_rnw/data.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> images = [
    "images/bg.png",
    "images/bg.png",
    "images/bg.png",
    "images/bg.png",
    "images/bg.png",
    "images/bg.png",
    "images/bg.png",
    "images/bg.png",
    "images/bg.png",
  ];
  var buttonColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  bool yourTurn = true;
  GameData gameData;
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    gameData = settings.arguments;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                            height: 55,
                            width: 55,
                            child: Image.asset(gameData.getSide1()))),
                    Expanded(child: Text('')),
                    Expanded(
                        child: SizedBox(
                            height: 55,
                            width: 55,
                            child: Image.asset(gameData.getSide2()))),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                          child: Text(
                        "YOU",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      )),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        child: RaisedButton(
                          elevation: 20.0,
                          color: Colors.white,
                          shape: StadiumBorder(),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                gameData.getP1().toString() +
                                    " - " +
                                    gameData.getP2().toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          gameData.isAi ? "AI" : "PLAYER 2",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          onSelected(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            color: buttonColor[index],
                          ),
                          padding: EdgeInsets.all(25.0),
                          child: Image.asset(images[index]),
                        ),
                      );
                      // return Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: RaisedButton(
                      //     elevation: 2.0,
                      //     padding: EdgeInsets.all(5.0),
                      //     onPressed: () {},
                      //     child: Image.asset(images[index]),
                      //     color: Colors.white,
                      //   ),
                      // );
                    },
                  ),
                ),
              ),
              Expanded(child: Setting()),
            ],
          ),
        ),
      ),
    );
  }

  List<int> marked = [];
  bool check = true;
  void onSelected(int index) {
    gameData.isAi
        ? setState(() {
            int temp;
            if (!marked.contains(index)) {
              images[index] =
                  yourTurn ? gameData.getSide1() : gameData.getSide2();
              marked.add(index);
              yourTurn = !yourTurn;
              buttonColor[index] = Colors.grey.shade100;
              if (marked.length == 9) {
                checkWinner();
              } else {
                if (checkWinner() != true) {
                  temp = Random()
                      .nextInt(9); //generates random integers from 0 to 8
                  while (marked.contains(temp)) {
                    temp = Random().nextInt(9);
                  }
                  images[temp] =
                      yourTurn ? gameData.getSide1() : gameData.getSide2();
                  marked.add(temp);
                  yourTurn = !yourTurn;
                  buttonColor[temp] = Colors.grey.shade100;
                  checkWinner();
                }
              }
            }
          })
        : setState(() {
            if (!marked.contains(index)) {
              images[index] =
                  yourTurn ? gameData.getSide1() : gameData.getSide2();
              marked.add(index);
              yourTurn = !yourTurn;
              buttonColor[index] = Colors.grey.shade100;
              checkWinner();
            }
          });
  }

  bool checkWinner() {
    if (images[0] == images[1] &&
        images[0] == images[2] &&
        images[0] != "images/bg.png") {
      showWinDialog(images[0], "Has won");
      return true;
    } else if (images[3] == images[4] &&
        images[3] == images[5] &&
        images[3] != "images/bg.png") {
      showWinDialog(images[3], "Has won");
      return true;
    } else if (images[6] == images[7] &&
        images[6] == images[8] &&
        images[6] != "images/bg.png") {
      showWinDialog(images[6], "Has won");
      return true;
    } else if (images[0] == images[3] &&
        images[0] == images[6] &&
        images[0] != "images/bg.png") {
      showWinDialog(images[0], "Has won");
      return true;
    } else if (images[1] == images[4] &&
        images[1] == images[7] &&
        images[1] != "images/bg.png") {
      showWinDialog(images[1], "Has won");
      return true;
    } else if (images[2] == images[5] &&
        images[2] == images[8] &&
        images[2] != "images/bg.png") {
      showWinDialog(images[2], "Has won");
      return true;
    } else if (images[0] == images[4] &&
        images[0] == images[8] &&
        images[0] != "images/bg.png") {
      showWinDialog(images[0], "Has won");
      return true;
    } else if (images[2] == images[4] &&
        images[2] == images[6] &&
        images[6] != "images/bg.png") {
      showWinDialog(images[2], "Has won");
      return true;
    } else if (images[0] != "images/bg.png" &&
        images[1] != "images/bg.png" &&
        images[2] != "images/bg.png" &&
        images[3] != "images/bg.png" &&
        images[4] != "images/bg.png" &&
        images[5] != "images/bg.png" &&
        images[6] != "images/bg.png" &&
        images[7] != "images/bg.png" &&
        images[8] != "images/bg.png") {
      showWinDialog("images/alert.png", "No one has won: TIE");
    } else {
      return false;
    }
  }

  showWinDialog(String string, String output) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      string,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    output,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox.expand(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          images[0] = images[1] = images[2] = images[3] =
                              images[4] = images[5] = images[6] =
                                  images[7] = images[8] = 'images/bg.png';
                          yourTurn = true;
                          marked.clear();
                          if (string != 'images/alert.png') {
                            gameData.getSide1() == string
                                ? gameData.increaseP1()
                                : gameData.increaseP2();
                          }
                          buttonColor[0] = buttonColor[1] = buttonColor[2] =
                              buttonColor[3] = buttonColor[4] = buttonColor[5] =
                                  buttonColor[6] = buttonColor[7] =
                                      buttonColor[8] = Colors.white;
                        });
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
