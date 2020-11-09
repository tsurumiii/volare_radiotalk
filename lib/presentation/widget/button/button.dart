import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {this.text = '',
      this.textSpan,
      this.fontSize = 14,
      this.fontWeight,
      this.height = 32,
      this.width = 120,
      this.padding,
      this.color,
      this.textColor,
      this.elevation = 0,
      this.isEnable = true,
      this.disabledColor,
      this.isRoundedCorner = false,
      this.roundedRectangleBorder,
      this.outlineInputBorder,
      this.leftWidget,
      this.rightWidget,
      this.isOutline = false,
      this.onTap});

  final String text;
  final TextSpan textSpan;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final EdgeInsets padding;
  final Color color;
  final Color textColor;
  final double elevation;
  final bool isEnable;
  final Color disabledColor;
  final bool isRoundedCorner;
  final RoundedRectangleBorder roundedRectangleBorder;
  final OutlineInputBorder outlineInputBorder;
  final Widget leftWidget;
  final Widget rightWidget;
  final bool isOutline;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: isOutline
          ? OutlineButton(
              padding: const EdgeInsets.only(left: 0, right: 0),
              borderSide: BorderSide(color: _color()),
              highlightedBorderColor: _color(),
              highlightColor: Colors.white.withOpacity(0.2),
              child: _textWidget(),
              color: isEnable
                  ? color != null
                      ? color
                      : Colors.blue
                  : Colors.grey.withOpacity(0.5),
              shape: isRoundedCorner
                  ? StadiumBorder()
                  : roundedRectangleBorder != null
                      ? roundedRectangleBorder
                      : null,
              onPressed: isEnable ? onTap : null,
            )
          : RaisedButton(
              padding: padding,
              elevation: elevation,
              highlightColor: Colors.white.withOpacity(0.2),
              child: _textWidget(),
              color: isEnable
                  ? color != null
                      ? color
                      : Colors.blue
                  : Colors.grey.withOpacity(0.5),
              shape: isRoundedCorner
                  ? StadiumBorder()
                  : roundedRectangleBorder != null
                      ? roundedRectangleBorder
                      : outlineInputBorder != null
                          ? outlineInputBorder
                          : null,
              onPressed: isEnable ? onTap : null,
            ),
    );
  }

  Widget _textWidget() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: leftWidget,
          ),
        ),
        Center(
          child: textSpan != null
              ? RichText(
                  text: textSpan,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: _textColor(),
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: rightWidget,
          ),
        ),
      ],
    );
  }

  Color _color() {
    final defaultColor = Colors.white;
    if (isEnable) {
      return color != null ? color : defaultColor;
    } else {
      return color != null
          ? color.withOpacity(0.5)
          : defaultColor.withOpacity(0.5);
    }
  }

  Color _textColor() {
    final defaultColor = Colors.white;
    if (isOutline) {
      return textColor != null ? textColor : _color();
    } else {
      return textColor != null ? textColor : defaultColor;
    }
  }
}
