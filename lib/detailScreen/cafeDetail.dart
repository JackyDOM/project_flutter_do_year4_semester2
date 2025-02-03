import 'package:flutter/material.dart';

class CafeDetail extends StatefulWidget {
  final Map<String, dynamic> cafeDetail;

  const CafeDetail({Key? key, required this.cafeDetail}) : super(key: key);

  @override
  _CafeDetailState createState() => _CafeDetailState();
}

class _CafeDetailState extends State<CafeDetail> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Grey background
      appBar: AppBar(
        title: Text(
          widget.cafeDetail['cafe_name'] ?? "Cafe Detail",
          style: const TextStyle(
            color: Colors.white, // White text color
            fontWeight: FontWeight.bold, // Optional: Makes text bold
          ),
        ),
        backgroundColor: Colors.brown, // Brown background
        iconTheme: const IconThemeData(color: Colors.white), // Makes back button white
      ),
      body: Column(
        children: [
          // Cafe Image with Grey Background
          Container(
            margin: const EdgeInsets.only(bottom: 20, top: 30, left: 15, right: 15),
            width: double.infinity,
            height: 220,
            color: Colors.grey[400], // Grey background
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Image.network(
                widget.cafeDetail['cafe_image'] ?? '',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.error, size: 100, color: Colors.red));
                },
              ),
            ),
          ),

          // White background section with rounded corners
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.cafeDetail['cafe_name'] ?? 'Unknown Cafe',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    // Expandable Description
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cafeDetail['description'] ?? 'No description available.',
                              style: const TextStyle(fontSize: 16),
                              maxLines: isExpanded ? null : 2,
                              overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Text(
                                isExpanded ? "See Less" : "See More",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // Stylish Famous Drink Section
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(Icons.local_cafe, size: 30, color: Colors.brown),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Famous Drink: ${widget.cafeDetail['famous_drink'] ?? 'Unknown'}",
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Stylish Location Section
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on, size: 30, color: Colors.redAccent),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Location: ${widget.cafeDetail['location'] ?? 'Unknown'}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
