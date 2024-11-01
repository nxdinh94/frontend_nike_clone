import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_size.dart';
class NotePassword extends StatelessWidget {
  const NotePassword({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(CupertinoIcons.xmark, color: Colors.grey, size: 18,),
        const SizedBox(width: 3),
        Text(text, style: Theme.of(context).textTheme.labelSmall,)
      ],
    );
  }
}
