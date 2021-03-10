import 'package:flutter/material.dart';
import 'package:soundpool/soundpool.dart';
import 'package:flutter/services.dart'; // use rootBundle

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Soundpoolインスタンスの初期化（１度だけ）

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
  Soundpool _pool = Soundpool(streamType: StreamType.notification);

  int myCount = 0;
  void increment() async {
// ファイルの読み込み
    int soundId =
        await rootBundle.load("assets/sounds/slidedown.wav").then((soundData) {
      return _pool.load(soundData);
    });
// 再生
    int streamId = await _pool.play(soundId);

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
