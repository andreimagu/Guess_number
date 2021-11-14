import 'dart:math';

import 'package:flutter/material.dart';

class App2Screen extends StatefulWidget {
  const App2Screen({Key? key}) : super(key: key);

  static const String routeName = '/app-2';

  @override
  _App2ScreenState createState() => _App2ScreenState();
}

class _App2ScreenState extends State<App2Screen> {
  final TextEditingController _controller = TextEditingController();
  double? numberInput;
  int oki = 0;
  int? i, ok;

  int verificationNumber(double numberInput) {
    final double a = sqrt(numberInput);
    int m = 0;
    final int n = numberInput.toInt();
    int i;
    for (i = 2; i <= n; i = i + 1) {
      int copie = n;
      int j = 0;
      if (n % i == 0) {
        while (copie % i == 0) {
          copie = copie ~/ i;
          j = j + 1;
        }

        if (j == 3 && copie == 1) {
          m = m + 2;
        }
      }
    }
    if (a == a.toInt())
      m = m + 1;
    else
      m = m + 0;
    return m;
  }

  void dialog(BuildContext context) {
    final int i = verificationNumber(numberInput!);
    print(i);
    String text = '';
    if (i == 0)
      text = 'Number $numberInput is neither TRIANGULAR OR SQUARE.';
    else if (i == 1)
      text = 'Number $numberInput is SQUARE.';
    else if (i == 2)
      text = 'Number $numberInput is TRIANGULAR';
    else if (i == 3) {
      text = 'Number $numberInput is both SQUARE and TRIANGULAR.';
    }

    final AlertDialog alertDialog = AlertDialog(
      title: Text('$numberInput'),
      content: Text(text),
    );

    showDialog<BuildContext>(context: context, builder: (BuildContext context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Shapes'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: const Text(
                  'Please input a number to see if it is square or triangular',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter your number',
                  suffix: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  numberInput = double.parse(value);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: () {
          setState(() {
            _controller.clear();
            oki = 1;
            dialog(context);
          });
        },
      ),
    );
  }
}
