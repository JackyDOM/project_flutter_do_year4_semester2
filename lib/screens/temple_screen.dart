import 'package:flutter/material.dart';
import 'package:project1/data/templeData.dart';

class temple_screen extends StatefulWidget {
  const temple_screen({super.key});

  @override
  State<temple_screen> createState() => _temple_screenState();
}

class _temple_screenState extends State<temple_screen> {
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
                      'Temple View',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF493408),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'View the temples to get more\nexperiences and learn new thing.',
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
                child: templeGrid()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
