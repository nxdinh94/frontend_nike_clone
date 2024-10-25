import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_size.dart';
class ActionNearSubtitle extends StatelessWidget {
  const ActionNearSubtitle({super.key, required this.text, this.callback});
  final String text;
  final VoidCallback ? callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Text(
        text, style: TextStyle(
          color: colorTextGrey,decoration: TextDecoration.underline, fontSize: normal)
        ),
    );
  }
}
