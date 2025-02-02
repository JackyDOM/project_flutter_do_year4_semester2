import 'package:flutter/material.dart';

class CafeDetail extends StatelessWidget {
  final Map<String, dynamic> cafeDetail;

  // Constructor (fixes name conflict)
  const CafeDetail({Key? key, required this.cafeDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cafeDetail['cafe_name'] ?? "Cafe Detail"),
        backgroundColor: Colors.brown, // Brown theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                cafeDetail['cafe_image'] ?? '',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 100, color: Colors.red);
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              cafeDetail['cafe_name'] ?? 'Unknown Cafe',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              cafeDetail['description'] ?? 'No description available.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Famous Drink: ${cafeDetail['famous_drink'] ?? 'Unknown'}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              "Location: ${cafeDetail['location'] ?? 'Unknown'}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
