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
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Text('Favorite', style: Theme.of(context).textTheme.headlineLarge),
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
                              voidCallback: (){},
                              favoriteProduct: favoriteProduct,
                              width:  MediaQuery.of(context).size.width / 2 -2,
                          );
                        }).toList()
                    );
                  }
                  return const CircularProgressIndicator();
                }
            ),
            const SizedBox(height: 16),
            Padding(
              padding: horizontalPadding,
              child: Divider(),
            ),
            // Horizontal List Section
            Padding(
              padding: horizontalPadding,
              child: SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
