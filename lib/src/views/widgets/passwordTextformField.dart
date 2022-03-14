import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obscureText;
  final String? Function(String? value) validator;
  final String name;
  final Function() onTap;
  final Function(String? value) onSaved;
  const PasswordTextFormField(
      {required this.obscureText,
      required this.validator,
      required this.name,
      required this.onTap,
      required this.onSaved,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
          hintText: name,
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
          ),
          hintStyle: const TextStyle(color: Colors.black),
          border: const OutlineInputBorder()),
    );
  }
}
