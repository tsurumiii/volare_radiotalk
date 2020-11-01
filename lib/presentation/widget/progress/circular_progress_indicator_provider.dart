import 'package:flutter/material.dart';

class CircularProgressIndicatorProvider extends StatelessWidget {
  const CircularProgressIndicatorProvider({
    this.child,
    this.color,
    this.strokeWidth = 2,
    this.isLoading = false,
    this.size = 30,
  });

  final Widget child;
  final Color color;
  final double strokeWidth;
  final bool isLoading;
  final double size;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SizedBox(
              height: size,
              width: size,
              child: CircularProgressIndicator(
                strokeWidth: strokeWidth,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          )
        : child;
  }
}
