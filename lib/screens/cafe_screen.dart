import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/data/cafeData.dart';

class cafe_screen extends StatefulWidget {
  const cafe_screen({super.key});

  @override
  State<cafe_screen> createState() => _cafe_screenState();
}

class _cafe_screenState extends State<cafe_screen> {
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
                      'Cafe Shop',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFAC1675),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enjoy your favorite cafe place\nand know about their famous\ndrink.',
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
                  child: cafeGrid()
              ),
            ],
          ),
        ),
      ),
    );

  }
}
