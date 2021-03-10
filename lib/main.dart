import 'package:flutter/material.dart';
import 'package:sounds/sounds.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cookie Flutter'),
          backgroundColor: Colors.brown,
        ),
        body: Center(child: MyCounter()),
      ),
    );
  }
}

class MyCounter extends StatefulWidget {
  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int myCount = 0;
  void increment() {
    // dont rings
    var track = Track.fromAsset('metal.mp3');
    if(track != null){
      QuickPlay.fromTrack(track, volume: 1.0);
    }
    
    setState(() {
      myCount += 1;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      children: [
        Spacer(),
        Text(
          myCount.toString(),
          style: TextStyle(color: Colors.brown),
        ),
        FloatingActionButton(
          onPressed: increment,
          child: Icon(Icons.plus_one),
          backgroundColor: Colors.amber,
        ),
        Spacer()
      ],
    )));
  }
}
