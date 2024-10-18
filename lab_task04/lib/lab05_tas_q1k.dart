import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showColumn = false;

  void _onLongPress() {
    setState(() {
      _showColumn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animation Lab'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        _showColumn = false;
                      },
                    );
                    // Star bounce down animation
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: BounceInDown(
                            child: CustonIcon(),
                          ),
                        );
                      },
                    );
                  },
                  onLongPress: _onLongPress,
                  child: Text('Long Press'),
                ),
              ),
              if (_showColumn)
                Column(
                  children: [
                    FadeInDown(
                        child: Icon(Icons.bike_scooter_rounded,
                            size: 100, color: Colors.blue)),
                    SlideInLeft(
                        child: Icon(Icons.hub_sharp,
                            size: 100, color: Colors.brown)),
                    BounceInUp(
                        child: Icon(Icons.baby_changing_station_rounded,
                            size: 100, color: Colors.orange)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustonIcon extends StatelessWidget {
  const CustonIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rate_outlined,
      size: 100,
      color: Colors.amber,
    );
  }
}
