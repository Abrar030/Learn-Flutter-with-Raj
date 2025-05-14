import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Hello Flutter",
              style: TextStyle(
                color: Colors.white,
                fontSize:30, 
              ),
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Text(
            "Welcom to the Flutter !!",
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
    ),
  );
}
