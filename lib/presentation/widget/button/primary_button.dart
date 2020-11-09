import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/master/colors.dart';

import 'button.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {@required this.text,
      @required this.width,
      this.fontSize = 18,
      this.height = 50,
      this.fontWeight = FontWeight.bold,
      this.onTap,
      this.isEnable});

  final String text;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onTap;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Button(
          text: text,
          fontSize: fontSize,
          textColor: kAppWhite,
          fontWeight: fontWeight,
          color: kAppBlue250,
          roundedRectangleBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          onTap: onTap,
          isEnable: isEnable ?? true,
        ));
  }
}
