import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      shape: CircleBorder(),
      child: CircleAvatar(
        radius: 30.0,
        child: Icon(
          Icons.settings,
          color: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
