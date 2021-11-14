import 'package:flutter/material.dart';

class ValidateText extends StatelessWidget {
  const ValidateText({
    Key? key,
    required this.inputValidate,
    required this.randomNumber,
  })  : assert(inputValidate != null),
        assert(randomNumber != null),
        super(key: key);

  final double inputValidate;
  final double randomNumber;

  String validate() {
    String text = '';
    if (inputValidate < randomNumber)
      text = 'You tried $inputValidate Try lower';
    else if (inputValidate > randomNumber)
      text = 'You tried $inputValidate try higher';
    else if (inputValidate == randomNumber)
      text = 'You tried $inputValidate You guessed right.';
    else if (inputValidate == -1 && randomNumber == -1) {
      text = 'Da';
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Text(validate());
  }
}
