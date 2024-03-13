import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlatButton extends ConsumerWidget {
  const FlatButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
  });
  final void Function() onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor ?? const Color(0xff171717),
        backgroundColor: backgroundColor ?? Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w800,
            color: foregroundColor ?? const Color(0xff171717)),
      ),
    );
  }
}
