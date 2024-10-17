import 'package:flutter/material.dart';

void main() {
  runApp(my_linkedin());
}

class my_linkedin extends StatelessWidget {
  const my_linkedin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black12, shape: BoxShape.circle),
                // child: Image(image: AssetImage('assests/abc.jpeg')),
              ),
              Container(
                width: 230,
                height: 50,
                margin: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(color: Colors.black26),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(97, 55, 54, 54)),
                  child: Icon(
                    Icons.add,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 30,
                height: 30,
                child: TextButton(onPressed: () {}, child: Icon(Icons.message)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
