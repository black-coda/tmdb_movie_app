import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({super.key, required this.childWidget});

  final Widget childWidget;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.childWidget,
      builder: (context, child) {
        double translateValue = 25 * (1 - _animationController.value);

        return Transform.translate(
          offset: Offset(0, translateValue),
          child: Opacity(
            opacity: _animationController.value,
            child: child,
          ),
        );
      },
    );
  }
}
