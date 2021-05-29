import 'package:flutter/material.dart';
import 'chatwindow.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "MyChat",
          ),
        ),
      ),
      body: new Chatwindow(),
    );
  }
}
