import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class templeGrid extends StatefulWidget {
  const templeGrid({super.key});

  @override
  State<templeGrid> createState() => _templeGridState();
}

class _templeGridState extends State<templeGrid> {
  List<dynamic> temples = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    fetchTemples();
  }

  Future<void> fetchTemples() async {
    try {
      final response = await http.get(Uri.parse('https://python-food-raw-api-1.onrender.com/api/temple'));

      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes); // Decode the response
        final data = json.decode(decodedResponse);
        print('Parsed Data: $data'); // Debugging
        setState(() {
          temples = data['data'];
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
        itemCount: temples.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 20, // Space between rows
          childAspectRatio: 0.8, // Adjust item size
        ),
        itemBuilder: (context, index) {
          final food = temples[index];
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9), // Light blue background
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      food['temple_image'], // Ensure this matches your API field
                      fit: BoxFit.cover,
                      height: 100,
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
                      food['temple_name'], // Ensure this matches your API field
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2C230F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
