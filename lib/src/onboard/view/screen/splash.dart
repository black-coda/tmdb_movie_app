import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/src/onboard/view/screen/screen.1.dart';
import 'package:tmdb_movie_app/src/onboard/view/screen/screen.2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          Screen1(),
          Screen2(),
        ],
      ),
    );
  }
}
