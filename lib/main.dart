import 'package:flutter/material.dart';

import 'app_1_screen.dart';
import 'app_2_screen.dart';
import 'main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tema_curs_3',
      home: const MainScreen(),
      routes: <String, WidgetBuilder>{
        App1Screen.routeName: (BuildContext ctx) => const App1Screen(),
        App2Screen.routeName: (BuildContext ctx) => const App2Screen(),
      },
    );
  }
}
