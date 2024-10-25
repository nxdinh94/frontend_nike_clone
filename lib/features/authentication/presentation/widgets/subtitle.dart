import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_size.dart';
class Subtitle extends StatelessWidget {
  const Subtitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width *0.6,),
          child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: colorTextBlack, fontSize: normal)
          ),
        ),
      ],
    );
  }
}
