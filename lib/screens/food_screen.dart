import 'package:flutter/material.dart';
import 'package:project1/data/bannerData.dart';

class food_screen extends StatelessWidget {
  const food_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Scrollable content
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16), // Padding for the body
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        'Food Recipe',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF8C00), // Orange color
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'More details about the recipe will go here.',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const BannerData(), // Banner widget that will scroll
                // Add more widgets/content here as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
