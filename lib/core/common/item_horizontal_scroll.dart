import 'package:fe_nike/core/common/custom_back_page_button.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class Items extends StatefulWidget {
  final ProductEntity productEntity;
  final double width;
  final double height;
  const Items({
    super.key,
    required this.productEntity,
    this.width = 150,
    this.height = 250
  });

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  String thumbnailUrl = '';
  @override
  void initState() {
    // get the first image of each item
    thumbnailUrl = widget.productEntity.thumbnail!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(
            CustomNavigationHelper.homeProductDetailPath,
            extra: widget.productEntity
        );
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
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
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.productEntity.subtitle.toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                        widget.productEntity.price.toString(),
                        style: Theme.of(context).textTheme.bodySmall
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
