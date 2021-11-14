import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class App1Screen extends StatefulWidget {
  const App1Screen({Key? key}) : super(key: key);

  static const String routeName = '/app-1';

  @override
  _App1ScreenState createState() => _App1ScreenState();
}

class _App1ScreenState extends State<App1Screen> {
 final TextEditingController _controller = TextEditingController();
  double v = 1;
  double? numberInput;
  double ok = 0;
  double ok1 = 0;
  Random? randomNumber;
  String random1 = randomBetween(1, 100).toString();
  double random = 49;
  String text = 'Buna';
  void validate() {
    if (numberInput! < random)
      text = 'You tried $numberInput Try higher';
    else if (numberInput! > random)
      text = 'You tried $numberInput try lower';
    else if (numberInput == random)
      text = 'You tried $numberInput You guessed right.';
    else if (numberInput == -1 && random == -1)
      text = 'Da';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess my number'),
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
                  'I am thinking of a number between 1 and 100',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: const Text(
                  'It is your turn to guess my number!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (ok != 0)
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Try a number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
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
                      if (random == numberInput && ok1 == 0)
                        AlertDialog(
                          elevation: 5,
                          title: const Text('You guessed right'),
                          content: Text('It was $numberInput'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  ok = 0;
                                  numberInput = null;
                                  random1 = randomBetween(1, 100).toString();
                                });
                              },
                              child: const Text('Try Again'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  ok1 = 1;
                                });
                              },
                              child: const Text('Ok'),
                            )
                          ],
                        ),
                      if (random == numberInput && ok1 == 1)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              ok = 0;
                              numberInput = null;
                              random1 = randomBetween(1, 100).toString();
                              ok1 = 0;
                            });
                          },
                          child: const Text('Reset'),
                        ),
                      if (random != numberInput)
                        TextButton(
                          onPressed: () {
                            _controller.clear();
                            if (ok == 0) {
                              setState(() {
                                random = double.parse(random1);
                                ok = 1;
                                validate();
                                print(random);
                                print(random1);
                              });
                            } else if (ok == 1 && random != numberInput)
                              setState(() {
                                validate();
                              });
                            else if (ok == 1 && random == numberInput)
                              setState(() {
                                validate();
                              });
                          },
                          child: const Text('Guess'),
                        ),
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
}