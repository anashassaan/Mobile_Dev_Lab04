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
  bool _isVisible = true;

  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void _onLongPress() {
    setState(() {
      _showColumn = true;
    });
  }

  void _changeContainerProperties() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
      _borderRadius = _borderRadius == BorderRadius.circular(8)
          ? BorderRadius.circular(50)
          : BorderRadius.circular(8);
    });
  }

  void _toggleOpacity() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Animation Lab')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showColumn = false;
                    });
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
              const SizedBox(height: 20),
              if (_showColumn)
                Column(
                  children: [
                    FadeInDown(
                      child: Icon(
                        Icons.bike_scooter_rounded,
                        size: 100,
                        color: Colors.blue,
                      ),
                    ),
                    SlideInLeft(
                      child: Icon(
                        Icons.hub_sharp,
                        size: 100,
                        color: Colors.brown,
                      ),
                    ),
                    BounceInUp(
                      child: Icon(
                        Icons.baby_changing_station_rounded,
                        size: 100,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeContainerProperties,
                child: Text('Simple Press'),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'Im I Visible?',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleOpacity,
                child: Text('Disappear me'),
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
