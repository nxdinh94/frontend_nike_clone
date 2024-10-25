import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
class Header extends StatelessWidget {
  const Header({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(color: colorTextBlack, fontSize: 30, height: 1.2),
        )
      ],
    );
  }
}
