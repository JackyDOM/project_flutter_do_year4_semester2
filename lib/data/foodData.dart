import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodCarousel extends StatefulWidget {
  const FoodCarousel({super.key});

  @override
  State<FoodCarousel> createState() => _FoodCarouselState();
}

class _FoodCarouselState extends State<FoodCarousel> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  List<dynamic> foods = [];
  bool isLoading = true; // Add loading flag

  @override
  void initState() {
    super.initState();
    fetchFoods();
  }

  Future<void> fetchFoods() async {
    try {
      final response = await http.get(Uri.parse('https://python-food-raw-api-1.onrender.com/api/foods'));
      print('Raw Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes); // Decode the response
        final data = json.decode(decodedResponse);
        setState(() {
          foods = data['data']
              .where((food) => food['category']['category_name'] == 'Dish') // Filter by category_name
              .toList(); // Convert the filtered data back to a list
          isLoading = false; // Stop loading
        });
      } else {
        print('Error: ${response.statusCode}, Body: ${response.body}');
        throw Exception('Failed to load foods');
      }
    } catch (e) {
      print('Error fetching food data: $e');
      setState(() {
        isLoading = false; // Stop loading if there's an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator()); // Show loading indicator
    }

    return Column(
      children: [
        SizedBox(
          height: 280, // Height for the food carousel
          child: PageView.builder(
            controller: controller,
            itemCount: foods.length,
            itemBuilder: (_, index) {
              final food = foods[index];
              return Container(
                margin: const EdgeInsets.only(left: 12, bottom: 12, right: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE5B4), // Light orange background
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10), // Margin for top space
                      child: ClipRRect(
                        child: Image.network(
                          food['food_image'], // Ensure this matches your API field
                          fit: BoxFit.cover,
                          height: 180, // Fixed height for consistency
                          width: 180,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, size: 80, color: Colors.red);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      food['food_name'], // Ensure this matches your API field
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
