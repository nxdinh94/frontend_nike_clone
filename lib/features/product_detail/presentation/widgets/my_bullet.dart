import 'package:flutter/material.dart';

class MyBullet extends StatelessWidget{
  const MyBullet({super.key,required this.bulletSize});
  final double bulletSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bulletSize,
      width: bulletSize,
      decoration: const BoxDecoration(
        color: Colors.black87,
        shape: BoxShape.circle,
      ),
    );
  }
}