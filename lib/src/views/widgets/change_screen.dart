import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String whichAccount;
  final Function() onTap;
  final String name;
  const ChangeScreen({
    required this.whichAccount, 
  required this.onTap, 
  required this.name,
  Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(whichAccount),
      const SizedBox(width: 10),
      GestureDetector(
        child:  Text(
          name,
          style: const TextStyle(
              color: Colors.cyan, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      )
    ]);
  }
}
