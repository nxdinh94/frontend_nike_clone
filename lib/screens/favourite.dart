import 'package:fe_nike/core/common/item_horizontal_scroll.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/bloc/event.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/widgets/favorite_product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/favorites/favorite_products/presentation/bloc/bloc.dart';
import '../features/favorites/favorite_products/presentation/bloc/state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final ScrollController _scrollController = ScrollController();
  bool hideAppBarTitle = true;

  void _handlePositionAttach() {
    if(_scrollController.offset >= 23){
      setState(() {
        hideAppBarTitle = false;
      });
    }else {
      setState(() {
        hideAppBarTitle = true;
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_handlePositionAttach);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: hideAppBarTitle ? const Text('') : const Text('Favorites'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Edit'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 24),
              child: Text('Favorites', style: Theme.of(context).textTheme.headlineLarge),
            ),
            // Grid Section
            BlocBuilder<FavoriteProductBloc, FavoriteProductState>(
                builder: (context, state){
                  if(state is GetFavoriteProductDone){
                    final List<FavoriteProductEntity> favoriteProducts = state.product ?? [];
                    return Wrap(
                        spacing: 4.0, // Space between items horizontally
                        runSpacing: 8.0, // Space between items vertically
                        children: favoriteProducts.map((FavoriteProductEntity favoriteProduct){
                          return FavoriteProductItems(
                              voidCallback: (){
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
                                              SizedBox(
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
                                                          Text(
                                                            favoriteProduct.price.toString(),
                                                            style: Theme.of(context).textTheme.titleSmall,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                favoriteProduct.subtitle??"Anonymous",
                                                                style: Theme.of(context).textTheme.labelSmall,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
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
                                                                favoriteProduct.color??"Anonymous",
                                                                style: Theme.of(context).textTheme.labelSmall,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    )
                                                  ],
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
                                                      onPressed: (){},
                                                      child: Text('More Details')
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
                              },
                              favoriteProduct: favoriteProduct,
                              width:  MediaQuery.of(context).size.width / 2 -2,
                          );
                        }).toList()
                    );
                  }
                  return const CircularProgressIndicator();
                }
            ),
            const SizedBox(height: 12),
            const Padding(padding: EdgeInsets.only(left: 24, right: 24), child: Divider()),
            const SizedBox(height: 12),

            // Horizontal List Section
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Find Your Next Favorites', style: Theme.of(context).textTheme.headlineLarge),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(10, (index) {
                          // return Items(
                          //   productEntity: productEntity
                          // )
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.red,
                              width: 100,
                              height: 200,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
