import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Random random = new Random();
  Color _currentColor = Colors.blue;
  int randomNumber = 0;
  int randomNumberOld = 0;

  void _onPressed() {
    while (randomNumber == randomNumberOld)
      randomNumber = random.nextInt(18);
    randomNumberOld = randomNumber;
    setState(() {
      _currentColor = Colors.primaries[randomNumber];
    });
  }

  Widget _buildContainer() {
    return Container(
            child: Text('Hey there '),
            alignment: Alignment.center,
            color: _currentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: Center(
            child: InkWell(
            onTap: () => _onPressed(),
              child: _buildContainer(),
        ),)
      );
  }
}
