import 'package:flutter/material.dart';

class ColoredInkWell extends StatelessWidget {
  const ColoredInkWell({
    @required this.child,
    @required this.color,
    this.onTap,
    this.radius = 5,
    this.padding = const EdgeInsets.all(10),
  });

  final Widget child;
  final Color color;
  final VoidCallback onTap;
  final double radius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.button,
      color: color,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        highlightColor: Colors.black.withOpacity(0.3),
        splashColor: Colors.black.withOpacity(0.1),
        onTap: onTap,
        child: Padding(
          child: child,
          padding: padding,
        ),
      ),
    );
  }
}
