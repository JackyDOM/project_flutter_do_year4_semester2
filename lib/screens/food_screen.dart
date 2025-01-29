import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class food_screen extends StatefulWidget {
  const food_screen({super.key});

  @override
  State<food_screen> createState() => _food_screenState();
}

class _food_screenState extends State<food_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Food"),
      ),
    );
  }
}
