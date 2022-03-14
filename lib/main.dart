import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/views/screens/cartscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Meetup',
      theme: ThemeData(),
      home: const CartScreen(),
    );
  }
}
