import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:project1/Home_Screen.dart';


class animated_Splash_Screen extends StatefulWidget {
  const animated_Splash_Screen({super.key});

  @override
  State<animated_Splash_Screen> createState() => _animated_Splash_ScreenState();
}

class _animated_Splash_ScreenState extends State<animated_Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child:
        Lottie.asset("assets/animation/Animation - 1738071452879.json"),
      ),
      nextScreen: Home_Screen(),
    duration: 5000,
    splashIconSize: 500,);
  }
}
