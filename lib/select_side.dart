import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_rnw/data.dart';

class SelectSide extends StatefulWidget {
  final bool isAi;
  SelectSide({this.isAi});
  @override
  _SelectSideState createState() => _SelectSideState();
}

class _SelectSideState extends State<SelectSide> {
  var groupVal = "images/side.png";
  var val1 = "images/cross.png";
  var val2 = "images/zero.png";
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Pick your side',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image.asset('images/cross.png'),
                        SizedBox(
                          height: 20.0,
                        ),
                        Transform.scale(
                          scale: 2,
                          child: Radio(
                            value: val1,
                            groupValue: groupVal,
                            onChanged: (val) {
                              setState(() {
                                selected = true;
                                groupVal = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image.asset('images/zero.png'),
                        SizedBox(
                          height: 20.0,
                        ),
                        Transform.scale(
                          scale: 2,
                          child: Radio(
                            value: val2,
                            groupValue: groupVal,
                            onChanged: (val) {
                              setState(() {
                                selected = true;
                                groupVal = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
              width: 150.0,
              child: RaisedButton(
                elevation: 30.0,
                color: Colors.white,
                shape: StadiumBorder(),
                onPressed: () {
                  GameData data = GameData(
                    player1: 0,
                    player2: 0,
                    side1: groupVal,
                    side2: groupVal == "images/cross.png"
                        ? "images/zero.png"
                        : "images/cross.png",
                    isAi: widget.isAi,
                  );
                  selected
                      ? Navigator.pushNamed(context, '/gameScreen',
                          arguments: data)
                      : showSideAlertDialog();
                },
                child: Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showSideAlertDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(20.0),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          "images/alert.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Please pick your side first !!!",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: SizedBox(
                    child: RaisedButton(
                      child: Text(
                        "OK",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.green,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
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
