import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/change_screen.dart';
import '../widgets/mybutton.dart';
import '../widgets/mytextformfield.dart';
import '../widgets/passwordTextformField.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = RegExp(p);

class _LoginState extends State<Login> {
  bool _obsecure = true;
  late String _email;
  late String _password;
  void validation() async {
    final FormState _formState = _formKey.currentState!;
    _formState.save();
    if (_formState.validate()) {
      // debugPrint('True');
     
    } else {
      debugPrint('False');
    }
  }

  Widget _buildAllParts() {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Login',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          MyTextFormField(
              onSaved: (value) {
                setState(() {
                  _email = value!;
                });
              },
              validator: (value) {
                if (value == '') {
                  return 'please fill email!';
                } else if (!regExp.hasMatch(value!)) {
                  return 'Invalid email!';
                }
                return '';
              },
              name: 'Email'),
          PasswordTextFormField(
            onSaved: (value) {
              setState(() {
                _password = value!;
              });
            },
            obscureText: _obsecure,
            validator: (value) {
              if (value!.length < 6) {
                return 'Password is too short!';
              } else if (value == '') {
                return 'Please fill password!';
              }
            },
            name: 'Password',
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                _obsecure = !_obsecure;
              });
            },
          ),
          MyButton(
            name: 'Login',
            onPressed: () {
              validation();
            },
          ),
          ChangeScreen(
              whichAccount: 'Don\'t have an account!',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const Signup(),
                  ),
                );
              },
              name: 'Signup')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildAllParts()],
            ),
          ),
        ),
      ),
    );
  }
}
