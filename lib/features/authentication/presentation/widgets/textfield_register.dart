import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class TextfieldRegister extends StatelessWidget {
  const TextfieldRegister({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.flex,
    this.icon,
    this.onTapIcon,
    this.isObscureText
  });
  final TextEditingController textEditingController;
  final String labelText;
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade800,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: labelText,
            labelStyle: const TextStyle(color: colorTextGrey),
            suffixIcon: GestureDetector(
              onTap: onTapIcon,
              child: Icon(
                icon, color: Colors.grey,
              ),
            )
        ),
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
}
