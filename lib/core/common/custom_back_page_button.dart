import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/material.dart';
class CustomBackPageButton extends StatelessWidget {
  const CustomBackPageButton({super.key, this.myfun});
  final VoidCallback ?  myfun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(myfun != null){
          myfun!();
        }else {
          CustomNavigationHelper.router.pop();
        }
      },
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: big,
      ),
    );
  }
}
