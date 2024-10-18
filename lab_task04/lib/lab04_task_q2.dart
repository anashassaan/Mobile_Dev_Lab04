import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('App Bar')),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              customContainer(color: const Color.fromARGB(255, 124, 99, 99)),
              customContainer(color: const Color.fromARGB(31, 112, 49, 49)),
              customContainer(color: const Color.fromARGB(255, 222, 123, 156)),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(color: Colors.red),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      customContainer(color: Colors.blue),
                      customContainer(color: Colors.red),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customContainer({required Color color, IconData icon = Icons.abc}) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
      ),
      child: Icon(
        icon,
        size: 50,
      ),
    );
  }
}
