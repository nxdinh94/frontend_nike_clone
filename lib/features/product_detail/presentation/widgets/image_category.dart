import 'package:flutter/material.dart';
class ImageCategory extends StatelessWidget {
  const ImageCategory({
    super.key,
    required this.voidCallback,
    required this.thumbnail,
    required this.isSelected
  });
  final VoidCallback voidCallback;
  final String thumbnail;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
        border: isSelected? Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey
                : Colors.black,
            width: 3
        ) : Border.all(color:  Colors.transparent),
      ),
      child: GestureDetector(
        onTap: voidCallback,
        child: Image.network(
          thumbnail,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
