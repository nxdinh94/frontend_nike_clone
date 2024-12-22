import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/colors.dart';

class MyTextfield extends StatefulWidget {
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
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  final _locale = 'en';
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

@override
  Widget build(BuildContext context) {

    return Expanded(
      flex: widget.flex,
      child: TextField(
        obscureText: widget.isObscureText ?? false,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          border: Theme.of(context).inputDecorationTheme.border,
          focusedBorder: Theme.of(context).inputDecorationTheme.border,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: colorTextLabelLight),

          suffixIcon: GestureDetector(
            onTap: widget.onTapIcon,
            child: Icon(widget.icon, color: Colors.grey),
          )
        ),
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        onChanged: (String value){
          value = _formatNumber(value.replaceAll(',', ''));
          widget.textEditingController.value = TextEditingValue(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          );
        },
      ),
    );
  }
}
