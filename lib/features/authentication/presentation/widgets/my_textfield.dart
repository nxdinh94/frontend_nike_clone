import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.flex = 1,
    this.icon,
    this.onTapIcon,
    this.isObscureText
  });
  final TextEditingController textEditingController;
  final String hintText;
  final int flex;
  final IconData ?  icon;
  final VoidCallback ?  onTapIcon;
  final bool ? isObscureText ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: TextField(
        obscureText: isObscureText ?? false,
        controller: textEditingController,
        decoration: InputDecoration(
          border: Theme.of(context).inputDecorationTheme.border,
          focusedBorder: Theme.of(context).inputDecorationTheme.border,
          hintText: hintText,
          hintStyle: const TextStyle(color: colorTextLabelLight),

          suffixIcon: GestureDetector(
            onTap: onTapIcon,
            child: Icon(icon, color: Colors.grey),
          )
        ),
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
}
