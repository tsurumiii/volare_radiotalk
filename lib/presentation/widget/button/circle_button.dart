import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    this.child,
    this.size = 40,
    this.elevation = 2,
    this.color,
    this.isEnable = true,
    this.onTap
  });

  final Widget child;
  final double size;
  final double elevation;
  final Color color;
  final bool isEnable;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + 10,
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: ButtonTheme(
        minWidth: size,
        height: size,
        child: RaisedButton(
          child: child,
          color: color != null ? color : Colors.blue,
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          elevation: elevation,
          onPressed: isEnable ? onTap : null,
        ),
      )
    );
  }
}