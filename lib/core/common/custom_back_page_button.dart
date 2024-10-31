import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class CustomBackPageButton extends StatelessWidget {
  const CustomBackPageButton({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pop();
      },
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: big,
      ),
    );
  }
}
