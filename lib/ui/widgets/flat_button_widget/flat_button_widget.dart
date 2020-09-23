import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  final String buttonText;

  final Color buttonColor;

  final Color textColor;

  final VoidCallback onPressed;

  final Alignment buttonAlignment;

  const FlatButtonWidget({
    Key key,
    this.buttonText,
    this.buttonColor,
    this.textColor = Colors.white,
    this.onPressed,
    this.buttonAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5.0,
      height: 40.0,
      alignment: buttonAlignment,
      child: FlatButton(
        color: buttonColor,
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.button.copyWith(color: textColor),
        ),
      ),
    );
  }
}
