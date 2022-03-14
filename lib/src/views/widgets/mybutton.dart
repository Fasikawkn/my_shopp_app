import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() onPressed;
  final String name;
  const MyButton({required this.name, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.lightBlue),
        onPressed: onPressed,
        child: Text(name),
      ),
    );
  }
}
