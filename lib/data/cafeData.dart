import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project1/detailScreen/cafeDetail.dart';

class cafeGrid extends StatefulWidget {
  const cafeGrid({super.key});

  @override
  State<cafeGrid> createState() => _cafeGridState();
}

class _cafeGridState extends State<cafeGrid> {
  List<dynamic> cafes = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    fetchCafes();
  }

  Future<void> fetchCafes() async {
    try {
      final response = await http.get(Uri.parse('https://python-food-raw-api-1.onrender.com/api/cafe'));

      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes); // Decode the response
        final data = json.decode(decodedResponse);
        print('Parsed Data: $data'); // Debugging
        setState(() {
          cafes = data['data'];
          isLoading = false; // Stop loading
        });
      } else {
        throw Exception('Failed to load temple.');
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

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: cafes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 20, // Space between rows
          childAspectRatio: 0.8, // Adjust item size
        ),
        itemBuilder: (context, index) {
          final cafe = cafes[index];
          final cafeDetail = cafe['cafe_detail'] ?? {}; // Get nested cafe_detail

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CafeDetail(cafeDetail: cafeDetail), // Use the correct class name
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE4F3FA), // Light blue background
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        cafe['cafe_image'], // Ensure this matches your API field
                        fit: BoxFit.cover,
                        height: 90,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error, size: 80, color: Colors.red);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        cafe['cafe_name'], // Ensure this matches your API field
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF57441B),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
