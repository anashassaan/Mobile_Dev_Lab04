import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Hero(
          tag: 'hero-image',
          child: Image(
            image: AssetImage('assests/abc.jpeg'),
            width: 500,
            height: 500,
          ),
        ),
      ),
    );
  }
}
