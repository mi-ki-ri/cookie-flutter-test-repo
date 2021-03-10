import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cookie Flutter'),
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
          style: TextStyle(color: Colors.amberAccent),
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
