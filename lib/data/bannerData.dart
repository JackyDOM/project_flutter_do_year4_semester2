import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerData extends StatefulWidget {
  const BannerData({super.key});

  @override
  State<BannerData> createState() => _BannerDataState();
}

class _BannerDataState extends State<BannerData> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  List<dynamic> banners = [];
  int currentIndex = 0; // Track the current page index

  @override
  void initState() {
    super.initState();
    fetchBanners().then((data) {
      setState(() {
        banners = data;
      });
    });

    // Listen to page changes
    controller.addListener(() {
      int newIndex = controller.page?.round() ?? 0;
      if (newIndex != currentIndex) {
        setState(() {
          currentIndex = newIndex;
        });
      }
    });
  }

  Future<List<dynamic>> fetchBanners() async {
    try {
      final response = await http.get(Uri.parse('https://python-food-raw-api-1.onrender.com/'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data'];
      } else {
        print('Error: ${response.statusCode}, Body: ${response.body}');
        throw Exception('Failed to load banners');
      }
    } catch (e) {
      print('Error during fetching banners: $e');
      return [];  // Return an empty list if there's an error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 280, // Height for the banner section
          child: PageView.builder(
            controller: controller,
            itemCount: banners.length,
            itemBuilder: (_, index) {
              final banner = banners[index];
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
                      child: ClipOval(
                        child: Image.network(
                          banner['image_banner'],
                          fit: BoxFit.cover,
                          height: 180, // Fixed height for consistency
                          width: 180,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      banner['name'],
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: controller,
          count: banners.length,
          effect: const JumpingDotEffect(
            dotWidth: 14,
            dotHeight: 14,
            jumpScale: .7,
            verticalOffset: 13,
          ),
        ),
      ],
    );
  }
}
