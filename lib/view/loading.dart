import 'package:flutter/material.dart';

class loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text('Loading...'),
        ),
        Padding(
            padding: EdgeInsets.all(25),
            child: LinearProgressIndicator(
              color: Colors.lightBlueAccent,
            )),
      ],
    );
  }
}
