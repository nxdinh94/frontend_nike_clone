
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';
import 'package:flutter/material.dart';
class FavoriteProductItems extends StatefulWidget {
  const FavoriteProductItems({
    super.key,
    required this.voidCallback,
    required this.favoriteProduct,
    this.width,
    this.height = 300,
  });
  final VoidCallback voidCallback;
  final FavoriteProductEntity favoriteProduct;
  final double ? width;
  final double ? height;

  @override
  State<FavoriteProductItems> createState() => _FavoriteProductItemsState();
}

class _FavoriteProductItemsState extends State<FavoriteProductItems> {

  String thumbnailUrl = '';

  @override
  void initState() {
    thumbnailUrl = widget.favoriteProduct.thumbnail!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.voidCallback,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 230,
              child: Image.network(thumbnailUrl,fit: BoxFit.cover),
            ),
            Padding(
              padding: defaultPadding,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.favoriteProduct.name??"Anonymous",
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.favoriteProduct.price.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
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
