import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  List<String> listImages = [
    'assets/food/1.jpg',
    'assets/food/2.jpg',
    'assets/food/3.jpg',
    'assets/food/4.jpg',
    'assets/food/5.jpg',
    'assets/food/6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 240,
                child: PageView.builder(
                    controller: controller,
                    itemCount: listImages.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            listImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
              // const Padding(
              //   padding: EdgeInsets.only(top: 24, bottom: 12),
              //   child: Text(
              //     'worm',
              //     style: TextStyle(color: Colors.black54),
              //   ),
              // ),
              // SmoothPageIndicator(
              //     controller: controller,
              //     count: listImages.length,
              //   effect: const WormEffect(
              //     dotWidth: 16,
              //     dotHeight: 16,
              //     type: WormType.thinUnderground,
              //   ),
              // ),

              // Jump dot
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 12),
                child: Text(
                  'worm',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: listImages.length,
                effect: const JumpingDotEffect(
                  dotWidth: 16,
                  dotHeight: 16,
                  jumpScale: .7,
                  verticalOffset: 15,
                ),
              ),


              // const Padding(
              //   padding: EdgeInsets.only(top: 24, bottom: 12),
              //   child: Text(
              //     'worm',
              //     style: TextStyle(color: Colors.black54),
              //   ),
              // ),
              // SmoothPageIndicator(
              //   controller: controller,
              //   count: listImages.length,
              //   effect: const ScrollingDotsEffect(
              //     activeStrokeWidth: 2.6,
              //     activeDotScale: 1.3,
              //     maxVisibleDots: 5,
              //     radius: 8,
              //     spacing: 10,
              //     dotHeight: 17,
              //     dotWidth: 12,
              //
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
