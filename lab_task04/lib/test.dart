import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    animation = Tween(begin: 0.0, end: 100.0).animate(animationController)
      ..addListener(() {
        setState(() {});
        // print(animation.value);
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: Colors.black,
        ),
      ),
    ));
  }
}
