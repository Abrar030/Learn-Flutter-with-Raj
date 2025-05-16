// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyListViewDemo()));

class DemoRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.star, size: 50, color: Colors.red),
            Icon(Icons.favorite, size: 50, color: Colors.green),
            Icon(Icons.thumb_up_sharp, size: 50, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors 
class DemoColumn extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Uppar Text", style: TextStyle(fontSize: 30)),
            Text("Middle Text", style:TextStyle(fontSize: 30)),
            Text("Lower Text", style:TextStyle(fontSize: 30)),
          ],
        ),
      )
    );
  }
}

class MyContainer extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          margin : EdgeInsets.all(50),
          color:Colors.blueGrey,
          child: Text('I am inside a container', style:TextStyle(fontSize:30, color: Colors.white)),
        ),
      ),
    );
  }
}


class MyPadding extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body:Padding(
        padding : EdgeInsets.all(160),
        child: Icon(Icons.star, size:100, color:Colors.yellowAccent)
      )
    );
  }
}

class MyExpand extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body:Row(
        children: [
          Expanded(child:Container(color:Colors.greenAccent,height: 300),
          ),
          Container(width: 200, color: Colors.black,height: 300,)
        ],
      )
    );
  }
}


class MyStack extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Stack(alignment: Alignment.center,
        children: [
          Container(width: 200,height: 200,color: Colors.blueAccent),
          Icon(Icons.play_circle_fill, size: 80, color: Colors.white),
        ],
        ),
      )
    );
  }
}

class MyListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
          5,
          (index) => Container(
            height: 100,
            margin: EdgeInsets.all(10),
            color: Colors.teal[100 * (index + 2)],
            child: Center(child: Text("Item ${index + 1}")),
          ),
        ),
      ),
    );
  }
}