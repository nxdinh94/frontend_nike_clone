import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JumpManAndNikeLogo extends StatelessWidget {
  const JumpManAndNikeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/logo-dark.svg', width: 70, height: 70,),
        SvgPicture.asset('assets/svg/basketball_logo_dark.svg', width: 70, height: 70,)
      ],
    );
  }
}
