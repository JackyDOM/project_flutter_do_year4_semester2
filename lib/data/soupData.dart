import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SoupCarousel extends StatefulWidget {
  const SoupCarousel({super.key});

  @override
  State<SoupCarousel> createState() => _SoupCarouselState();
}

class _SoupCarouselState extends State<SoupCarousel> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  List<dynamic> soups = [];
  bool isLoading = true; // Add loading flag

  @override
  void initState() {
    super.initState();
    fetchSoups();
  }

  Future<void> fetchSoups() async {
    try {
      final response = await http.get(Uri.parse('https://python-food-raw-api-1.onrender.com/api/foods'));

      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes); // Decode the response
        final data = json.decode(decodedResponse);
        setState(() {
          soups = data['data']
              .where((soup) => soup['category']['category_name'] == 'Soup') // Filter by category_name
              .toList(); // Convert the filtered data back to a list
          isLoading = false; // Stop loading
        });
      } else {
        throw Exception('Failed to load soups.');
      }
    } catch (e) {
      setState(() {
        isLoading = false; // Stop loading if there's an error
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator()); // Show loading indicator
    }
    return Column(
      children: [
        SizedBox(
          height: 280, // Height for the food carousel
          child: PageView.builder(
            controller: controller,
            itemCount: soups.length,
            itemBuilder: (_, index) {
              final food = soups[index];
              return Container(
                margin: const EdgeInsets.only(left: 12, bottom: 12, right: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF1BF), // Light orange background
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
                        color: Color(0xFFB25A0D),
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
