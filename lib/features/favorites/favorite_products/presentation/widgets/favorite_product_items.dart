
import 'package:fe_nike/core/constants/default-product-image.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/change_favorite_product/presentation/bloc/bloc.dart';
import 'package:fe_nike/features/change_favorite_product/presentation/bloc/event.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FavoriteProductItems extends StatefulWidget {
  const FavoriteProductItems({
    super.key,
    required this.voidCallback,
    required this.favoriteProduct,
    required this.isEditFavoriteProducts,
    this.width,
    this.height = 300,
  });
  final VoidCallback voidCallback;
  final FavoriteProductEntity favoriteProduct;
  final bool isEditFavoriteProducts;
  final double ? width;
  final double ? height;

  @override
  State<FavoriteProductItems> createState() => _FavoriteProductItemsState();
}

class _FavoriteProductItemsState extends State<FavoriteProductItems> {

  String thumbnailUrl = '';
  bool isFavorite = true;

  @override
  void initState() {
    context.read<GetFavoriteStateBloc>().add(GetFavorite(productId: widget.favoriteProduct.id.toString()));

    thumbnailUrl = widget.favoriteProduct.thumbnail ?? defaultImageURL;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        widget.voidCallback();
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Image.network(
                    key: Key(thumbnailUrl),
                      thumbnailUrl,
                      fit: BoxFit.cover
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Visibility(
                    visible: widget.isEditFavoriteProducts,
                    child: Padding(
                      padding: defaultPadding,
                      child: ClipOval(
                        child: Container(
                          height: 30,
                          width: 30,
                          color: Theme.of(context).colorScheme.surface,
                          child: Icon(
                            isFavorite ? CupertinoIcons.suit_heart_fill: CupertinoIcons.heart,
                            size: 24,
                            semanticLabel: isFavorite ? 'Added to favorites' : 'Add to favorites',
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              ],
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
