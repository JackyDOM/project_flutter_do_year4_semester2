import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/data/seaData.dart';

class sea_screen extends StatefulWidget {
  const sea_screen({super.key});

  @override
  State<sea_screen> createState() => _sea_screenState();
}

class _sea_screenState extends State<sea_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA), // Light grey background
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Column(
                  children: [
                    Text(
                      'Beach Place',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B3C73),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Choose your places to know\nmore about it.',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF918F8F),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded( // Wrap seaGrid inside Expanded
                child: seaGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
