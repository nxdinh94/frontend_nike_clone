import 'package:flutter/material.dart';

import 'my_bullet.dart';
class BulletText extends StatelessWidget {
  const BulletText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8,),
        const MyBullet(bulletSize: 5),
        const SizedBox(width: 18),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,)
        )
      ],
    );
  }
}
