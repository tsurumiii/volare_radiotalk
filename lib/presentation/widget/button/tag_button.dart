import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/master/colors.dart';

import 'colored_ink_well.dart';

class TagButton extends StatelessWidget {
  const TagButton({@required this.text, this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ColoredInkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: kAppWhite,
          fontSize: 10,
          height: 1.1,
        ),
      ),
      color: kAppWhite500,
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      radius: 15,
    );
  }
}
