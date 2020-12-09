import 'package:flutter/material.dart';
import 'package:tic_tac_toe_rnw/components.dart';
import 'package:tic_tac_toe_rnw/select_side.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('images/cross.png'),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('images/zero.png'),
              )),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Choose your play mode',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50.0,
            child: RaisedButton(
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => SelectSide(
                    isAi: true,
                  ),
                );
                Navigator.of(context).push(
                  route,
                );
              },
              child: Text(
                'With AI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              shape: StadiumBorder(),
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50.0,
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => SelectSide(
                    isAi: false,
                  ),
                );
                Navigator.of(context).push(
                  route,
                );
              },
              child: Text(
                'With a friend',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              shape: StadiumBorder(),
            ),
          ),
          SizedBox(
            height: 70.0,
          ),
          Setting(),
        ],
      ),
    );
  }
}
