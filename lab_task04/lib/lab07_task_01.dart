import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 0;
  int _milliseconds = 0;
  bool _isRunning = false;
  Timer? _timer;

  void _startTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
      });
      _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
        setState(() {
          _milliseconds++;
          if (_milliseconds == 1000) {
            _milliseconds = 0;
            _seconds++;
          }
        });
      });
    }
  }

  void _stopTimer() {
    if (_isRunning) {
      setState(() {
        _isRunning = false;
      });
      _timer?.cancel();
    }
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _seconds = 0;
      _milliseconds = 0;
    });
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Task 01  Timer',
        )),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ' $_seconds ',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    ': $_milliseconds',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 450),
            child: Row(
              children: [
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _startTimer,
                  child: Text('Start Timer'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: Text('Stop Timer'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text('Reset Timer'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
