import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GDSC EWHA TIMER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 60;
  var _timer;

  void _startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,    //중앙정렬
        elevation: 0.0, //앱바 하단 그림자 지우기
        backgroundColor: Color(0xff007042),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_counter > 0) ? const Text("")     //앞의 수식이 true면 : 앞을 반환, false면 뒤를 반환
                :
            const Text(
              "Time's up!",
              style: TextStyle(
                color: Color(0xff007042),
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () => _startTimer(),
              child: const Text("count down start!"),
            ),
          ],
        ),
      ),
    );
  }
}
