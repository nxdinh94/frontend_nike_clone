import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:flutter/material.dart';
class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/shoes/AIR_FORCE.png', width: 150, height: 170, fit: BoxFit.cover,)
          ),
          Padding(
            padding: topPadding,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Air Force 1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: tiny),),
                  const Text("Older kid's shoes", style: TextStyle(fontSize: tiny, color: colorTextGrey)),
                  Text('đ3.000.000', style: TextStyle(color: colorTextBlack),),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
