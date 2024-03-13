import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/src/onboard/view/widget/btn.dart';

import '../widget/animation/fade_in_animation.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: Image.asset(
              "assets/images/splash.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.25),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                gradient: const LinearGradient(
                  tileMode: TileMode.mirror,
                  colors: [
                    Colors.transparent,
                    Color(0xff0D0E12),
                    Color(0xff0D0E12),
                    Color(0xff0D0E12),
                    // Color.fromARGB(255, 92, 69, 69),
                  ],
                ),
              ),
            ),
          ),
          const FadeInAnimation(childWidget: ContentWidget()),
          Align(
            alignment: const Alignment(0, 0.95),
            child: Text(
              "Privacy and Terms",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff709BFF),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
          const Text(
            "max",
            style: TextStyle(
              fontFamily: "RRR",
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Start Streaming Now",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white, fontSize: 28),
          ),
          const SizedBox(height: 8),
          const Text(
            "Get ready to dive to dive into the greatest stories in Tv and Film.",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
          SizedBox(
            height: 42,
            width: double.infinity,
            child: FlatButton(
              onPressed: () {},
              text: "Login",
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 42,
            width: double.infinity,
            child: FlatButton(
              onPressed: () {},
              text: "Sign In",
              backgroundColor: const Color(0xff2A2E3D),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
