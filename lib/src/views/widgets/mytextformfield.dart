import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? Function(String? value) validator;
  final String name;
  final TextInputType? textInputType;
  final Function(String? value) onSaved;

  const MyTextFormField(
      {required this.validator,
      required this.name,
      required this.onSaved,
       this.textInputType,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
          hintText: name,
          hintStyle: const TextStyle(color: Colors.black),
          border: const OutlineInputBorder()),
    );
  }
}
