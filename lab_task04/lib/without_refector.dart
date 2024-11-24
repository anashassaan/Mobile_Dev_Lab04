import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('WithOut Code Refectorization')),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First Column of Containers with different colors
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.red,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.green,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.blue,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.yellow,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                // Second Column of Containers with different colors
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.orange,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.purple,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.cyan,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.brown,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                // Third Column of Containers with different colors
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.pink,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.teal,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.lime,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
