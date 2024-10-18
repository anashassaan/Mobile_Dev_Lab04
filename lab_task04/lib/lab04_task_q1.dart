import 'package:flutter/material.dart';

void main() {
  runApp(const homepage());
}

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('App Bar')),
        ),
        body: Container(
          child: TextButton(
              onPressed: () {
                print('Button Pressed');
              },
              child: Icon(
                Icons.add,
                size: 50,
              )),
          width: 1100,
          height: 1100,
          decoration: const BoxDecoration(color: Colors.amber),
        ),
      ),
    );
  }
}
