
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/bloc/get_favorite_products/bloc.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/bloc/get_favorite_products/event.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
void showMyBottomSheet (BuildContext context, FavoriteProductEntity favoriteProduct){
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
    ),
    // Make it pop up over navigator
    useRootNavigator: true,
    builder: (BuildContext context) {
      //This will automatically expand the bottomSheet according to content inside.
      return Wrap(
        children: [
          Container(
            padding: defaultPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    Navigator.pop(context);
                    await context.push(
                      CustomNavigationHelper.homeProductDetailPath,
                      extra: favoriteProduct
                    );
                  },
                  child: SizedBox(
                    height: 160,
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              favoriteProduct.thumbnail.toString(),
                              width: 150, height: 150, fit: BoxFit.cover,
                            )
                        ),
                        Padding(
                            padding: defaultPadding,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          favoriteProduct.name??"Anonymous",
                                          style: Theme.of(context).textTheme.titleSmall,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      favoriteProduct.subtitle??"Anonymous",
                                      style: Theme.of(context).textTheme.labelSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      favoriteProduct.color??"Anonymous",
                                      style: Theme.of(context).textTheme.labelSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Text(
                                  favoriteProduct.price.toString(),
                                  style: Theme.of(context).textTheme.titleSmall,
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ],
                            )
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: verticalPadding,
                  child: Divider(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                            context.push(
                              CustomNavigationHelper.homeProductDetailPath,
                              extra: favoriteProduct
                            );
                          },
                          child: const Text('More Details')
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}