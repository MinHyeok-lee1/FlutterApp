import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stop watch',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const StopWatchPage(),
    );
  }
}

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({Key? key}) : super(key: key);

  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  var _icon = Icons.play_arrow;
  var _color = Colors.amber;

  late Timer _timer;
  late Timer _timer0;
  late Timer _timer1;
  late Timer _timer2;
  late Timer _timer3;
  late Timer _timer4;
  late Timer _timer5;
  late Timer _timer6;
  late Timer _timer7;
  late Timer _timer8;

  var _time = 0; // 실제 늘어날 시간
  var _isPlaying = false; // 시작/정지 상태값
  final List<String> _saveTimes = []; // 기록하기 위한 리스트
  var x = 0;

  @override
  void dispose() {
    cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stop watch'),
      ),
      body: _body(),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 80),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _click();
        }),
        child: Icon(_icon),
        backgroundColor: _color,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // 시간 보여지는 부분
  Widget _body() {
    var sec = _time ~/ 1000; // 초
    var hundredth = '${(_time % 1000)}'.padLeft(3, '0');

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Stack(
          // 위젯 위에 위젯 겹치기 가능
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      // seconds 영역
                      '$sec',
                      style: const TextStyle(fontSize: 80),
                    ),
                    Text(
                      // milliseconds 영역
                      '.$hundredth',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50, // 여백
                ),
                SizedBox(
                  width: 200,
                  height: 300,
                  child: ListView(
                    children: _saveTimes
                        .map((time) => Text(
                      time,
                      style: const TextStyle(fontSize: 20),
                    ))
                        .toList(),
                  ),
                )
              ],
            ),
            Positioned(
              right: 0,
              bottom: 80,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _reset();
                  });
                },
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    'Clear Board',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 20,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _saveTime('$sec.$hundredth');
                  });
                },
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    'Save Time!!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 시작, 일시정지 버튼
  void _click() {
    _isPlaying = !_isPlaying;

    if (_isPlaying) {
      _icon = Icons.pause;
      _color = Colors.grey;
      _start();
    } else {
      _icon = Icons.play_arrow;
      _color = Colors.amber;
      _pause();
    }
  }

  // 1/1000초에 한 번씩 time 1씩 증가
  void _start() {
      _timer = Timer.periodic(const Duration(milliseconds: 9), (timer) {
        setState(() {
          _time++;
        });
      });
      _timer0 = Timer.periodic(const Duration(milliseconds: 9), (timer) {
        setState(() {
          _time++;
        });
      });
      _timer1 = Timer.periodic(const Duration(milliseconds: 9), (timer) {
        setState(() {
          _time++;
        });
      });
      _timer2 = Timer.periodic(const Duration(milliseconds: 9), (timer) {
        setState(() {
          _time++;
        });
      });
      _timer3 = Timer.periodic(const Duration(milliseconds: 9), (timer) {
        setState(() {
          _time++;
        });
      });
      _timer4 = Timer.periodic(const Duration(milliseconds: 9), (timer) {
        setState(() {
          _time++;
        });
      });
      _timer5 = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _time++;
        });
      });
      _timer6 = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _time++;
        });
      });
      _timer7 = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _time++;
        });
      });
      _timer8 = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _time++;
        });
      });
  }

  // 타이머 중지(취소)
  void _pause() {
    cancel();
  }

  // 초기화
  void _reset() {
    setState(() {
      _isPlaying = false;
      cancel();

      _saveTimes.clear();
      _time = 0;
    });
  }

  // 기록하기
  void _saveTime(String time) {
    _saveTimes.insert(0, '${_saveTimes.length + 1}등 : $time');
  }

  void cancel(){
    _timer.cancel();
    _timer0.cancel();
    _timer1.cancel();
    _timer2.cancel();
    _timer3.cancel();
    _timer4.cancel();
    _timer5.cancel();
    _timer6.cancel();
    _timer7.cancel();
    _timer8.cancel();
  }
}
