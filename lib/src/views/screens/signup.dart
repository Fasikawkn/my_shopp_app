import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/change_screen.dart';
import '../widgets/mybutton.dart';
import '../widgets/mytextformfield.dart';
import '../widgets/passwordTextformField.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                                                                                                                                                                                                                                                        final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = RegExp(p);

bool _obsecure = true;

class _SignupState extends State<Signup> {
  late String _email;
  late String _password;
  void validation() async {
    final FormState _formState = _formKey.currentState!;
    _formState.save();
    if (_formState.validate()) {
      debugPrint('True');
      debugPrint(_password);
      debugPrint(_email);
      try {
        UserCredential _userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
      } on PlatformException catch (e) {
        debugPrint(e.message);
      } catch (e) {
        debugPrint(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    } else {
      debugPrint('False');
    }
  }

  Widget _buildAppPart(Size size) {
    return Container(
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            onSaved: (value) {},
            validator: (value) {
              if (value!.length < 6) {
                return 'Username is too short';
              } else if (value == '') {
                return 'please fill username!';
              }
            },
            name: 'Username',
          ),
          MyTextFormField(
              textInputType: TextInputType.emailAddress,
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
              },
              name: 'Email'),
          PasswordTextFormField(
            onSaved: (value) {
              _password = value!;
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
          MyTextFormField(
            textInputType: TextInputType.phone,
            onSaved: (value) {},
            name: 'Phone Number',
            validator: (value) {
              if (value!.length < 10) {
                return 'Phone number must be 10';
              } else if (value == '') {
                return 'Please fill phone number!!';
              }
            },
          ),
          MyButton(
            name: 'Register',
            onPressed: () {
              validation();
            },
          ),
          ChangeScreen(
              whichAccount: 'I have already an account!',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const Login(),
                  ),
                );
              },
              name: 'Login')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _buildAppPart(size)
                ],
              ),
            ),
          ),
        ));
  }
}
