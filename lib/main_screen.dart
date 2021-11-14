import 'package:flutter/material.dart';
import './app_1_screen.dart';
import './app_2_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tema_curs_3'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Guess my number',
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(App1Screen.routeName);
            },
          ),
          const SizedBox(height: 10),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Number Shapes',
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(App2Screen.routeName);
            },
          )
        ],
      ),
    );
  }
}