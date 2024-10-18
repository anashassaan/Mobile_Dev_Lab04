import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animation Lab'),
        ),
        body: Center(
          child: Stack(
            children: [
              Positioned(
                left: _animation.value,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                bottom: 50,
                left: 20,
                child: ElevatedButton(
                  onPressed: () {
                    if (_controller.isAnimating) {
                      _controller.stop();
                    } else {
                      _controller.repeat(reverse: true);
                    }
                  },
                  child: Text('Start/Stop Animation'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
