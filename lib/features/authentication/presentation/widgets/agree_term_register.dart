import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_size.dart';
class AgreeTermRegister extends StatefulWidget {
  const AgreeTermRegister({
    super.key,
    required this.text,
    required this.flag,
    required this.valueChanged
  });
  final String text;
  final bool flag;
  final  Function(bool?) valueChanged;

  @override
  State<AgreeTermRegister> createState() => _AgreeTermRegisterState();
}

class _AgreeTermRegisterState extends State<AgreeTermRegister> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.0,
          width: 24.0,
          child: Checkbox(
            value: widget.flag,
            onChanged: widget.valueChanged,
            side: const BorderSide(color: Colors.grey, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            activeColor: Colors.grey.shade800,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            widget.text,
            style: const TextStyle(color: colorTextBlack, fontSize: small),
          ),
        )
      ],
    );
  }
}
