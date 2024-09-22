import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';
import 'package:flutter/material.dart';
class Items extends StatefulWidget {
  final ProductEntity productEntity;
  const Items({super.key, required this.productEntity});

  @override
  State<Items> createState() => _ItemsState();


}

class _ItemsState extends State<Items> {
  String thumbnailUrl = '';
  @override
  void initState() {
    // get the first image of each item
    thumbnailUrl = widget.productEntity.imageList?[widget.productEntity.imageList!.keys.toList().first][0]['url'];
    super.initState();
  }
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
            child: Image.network(thumbnailUrl, width: 150, height: 170, fit: BoxFit.cover,)
          ),
          Padding(
            padding: topPadding,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productEntity.name.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: tiny),
                    overflow: TextOverflow.ellipsis,

                  ),
                  Text(
                      widget.productEntity.subtitle.toString(),
                      style: TextStyle(fontSize: tiny, color: colorTextGrey),
                      overflow: TextOverflow.ellipsis,
                  ),
                  Text(widget.productEntity.price.toString(), style: TextStyle(color: colorTextBlack),),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
