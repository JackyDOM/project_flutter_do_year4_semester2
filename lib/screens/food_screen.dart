import 'package:flutter/material.dart';
import 'package:project1/data/bannerData.dart';
import 'package:project1/data/dessertData.dart';
import 'package:project1/data/soupData.dart';

import '../data/foodData.dart';

class food_screen extends StatelessWidget {
  const food_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA), // Light grey background
      body: SafeArea(
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
                        color: Color(0xFFB25A0D), // Orange color
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'More details about the recipe will go here.',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF918F8F),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 16),
                    const BannerData(), // Banner widget that will scroll
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 10),
                      alignment: Alignment.centerLeft, // Aligns the content to the left
                      child: Row(
                        children: [
                          Icon(
                            Icons.fastfood,
                            color: Color(0xFF3F51B5),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Dish",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F51B5),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const FoodCarousel(),

                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.cake,
                            color: Color(0xFF303F9F),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Dessert",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F51B5),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const DessertCarousel(),

                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.soup_kitchen,
                            color: Color(0xFF303F9F),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Soup",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F51B5),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SoupCarousel(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
