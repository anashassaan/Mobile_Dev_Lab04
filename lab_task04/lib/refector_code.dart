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
          title: Center(child: Text('Re Fectored Code')),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildColumn(
                    [Colors.red, Colors.green, Colors.blue, Colors.yellow]),
                SizedBox(width: 10),
                buildColumn(
                    [Colors.orange, Colors.purple, Colors.cyan, Colors.brown]),
                SizedBox(width: 10),
                buildColumn(
                    [Colors.pink, Colors.teal, Colors.lime, Colors.indigo]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColumn(List<Color> colors) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: colors.map((color) => buildContainer(color)).toList(),
    );
  }

  Widget buildContainer(Color color) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      color: color,
    );
  }
}
