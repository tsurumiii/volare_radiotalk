import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    this.text = '',
    this.textSpan,
    this.fontSize = 14,
    this.fontWeight,
    this.height = 32,
    this.width = 120,
    this.padding,
    this.gradient,
    this.textColor,
    this.shadowRadius = 0,
    this.isEnable = true,
    this.disabledColor,
    this.borderRadius,
    this.leftWidget,
    this.onTap
  });

  final String text;
  final TextSpan textSpan;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final EdgeInsets padding;
  final Gradient gradient;
  final Color textColor;
  final double shadowRadius;
  final bool isEnable;
  final Color disabledColor;
  final BorderRadius borderRadius;
  final Widget leftWidget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius != null ? this.borderRadius : BorderRadius.circular(2);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isEnable != true ? Colors.grey.withOpacity(0.5) : null,
        gradient: isEnable != true ? null : gradient,
        borderRadius: borderRadius,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: isEnable ? shadowRadius : 0,
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          highlightColor: Colors.white.withOpacity(0.4),
          child: Container(
            padding: padding != null ? padding : const EdgeInsets.all(6),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: leftWidget,
                  ),
                ),
                Center(
                  child: textSpan != null
                      ? RichText(
                    text: textSpan,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ) : Text(
                    text,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                )
              ],
            )
          ),
          onTap: isEnable ? onTap : null,
        ),
      ),
    );
  }
}