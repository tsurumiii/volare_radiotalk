import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/master/colors.dart';

import 'button.dart';

class RoundedChip extends StatelessWidget {
  const RoundedChip(
      {@required this.text,
      @required this.width,
      this.fontSize = 18,
      this.fontWeight = FontWeight.bold,
      this.isSelected = false});

  final String text;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: 36,
        child: Container(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? kAppWhite : kAppBlack50,
                fontSize: fontSize,
                fontWeight: fontWeight,
                height: 1.25,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: isSelected ? kAppOrange200 : kAppWhite,
            border:
                isSelected ? null : Border.all(width: 2, color: kAppBlack50),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
        ));
  }
}
