import 'package:flutter/material.dart';

import 'screen.2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _animationController.forward().whenComplete(
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Screen2(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 0.9,
              colors: [
                Color(0xff1131F5),
                Color(0xff020475),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "max",
                  style: TextStyle(
                    fontFamily: "RRR",
                    fontSize: 160,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
              ),
              Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => CircularProgressIndicator(
                    color: Colors.white,
                    value: _animationController.value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
