import 'package:flutter/material.dart';
import 'package:project1/data/bannerData.dart';

import '../data/foodData.dart';

class food_screen extends StatelessWidget {
  const food_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA), // Light grey background
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
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10),
                  alignment: Alignment.centerLeft, // Aligns the content to the left
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the left
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.fastfood, // You can replace this with any icon of your choice
                            color: Color(0xFF3F51B5), // Orange color for the icon
                          ),
                          SizedBox(width: 8), // Adds some space between the icon and text
                          Text(
                            "Dish",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F51B5), // Orange color for the text
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const FoodCarousel(),

                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  alignment: Alignment.centerLeft, // Aligns the content to the left
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the left
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.cake, // You can replace this with any icon of your choice
                            color: Color(0xFF303F9F), // Orange color for the icon
                          ),
                          SizedBox(width: 8), // Adds some space between the icon and text
                          Text(
                            "Dessert",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F51B5), // Orange color for the text
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
