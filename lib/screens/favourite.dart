import 'package:fe_nike/features/change_favorite_product/presentation/bloc/bloc.dart';
import 'package:fe_nike/features/change_favorite_product/presentation/bloc/event.dart';
import 'package:fe_nike/features/favorites/favorite_products/domain/entity/favorite_product_entity.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/widgets/bottom_sheet.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/widgets/favorite_product_items.dart';
import 'package:fe_nike/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../features/favorites/favorite_products/presentation/bloc/get_favorite_products/bloc.dart';
import '../features/favorites/favorite_products/presentation/bloc/get_favorite_products/event.dart';
import '../features/favorites/favorite_products/presentation/bloc/get_favorite_products/state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final ScrollController _scrollController = ScrollController();
  bool hideAppBarTitle = true;
  bool isEditFavoriteProducts = false;

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
            onPressed: () {
              setState(() {
                isEditFavoriteProducts = !isEditFavoriteProducts;
              });
            },
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
              builder: (context, state) {
                if (state is GetFavoriteProductDone) {
                  final List<FavoriteProductEntity> favoriteProducts = state.product ?? [];
                  return Wrap(
                    spacing: 4.0, // Space between items horizontally
                    runSpacing: 8.0, // Space between items vertically
                    children: favoriteProducts.map((item) {
                      return FavoriteProductItems(
                        voidCallback: () {
                          if (isEditFavoriteProducts) {
                            context.read<GetFavoriteStateBloc>().add(
                              ChangeFavoriteState(productId: item.id.toString()),
                            );
                          } else {
                            showMyBottomSheet(context, item);
                          }
                        },
                        isEditFavoriteProducts: isEditFavoriteProducts,
                        favoriteProduct: item,
                        width: MediaQuery.of(context).size.width / 2 - 2,
                      );
                    }).toList(),
                  );
                }

                // Fallback UI for other states
                if (state is GetFavoriteProductLoading) {
                  return const CircularProgressIndicator();
                }

                return const Center(child: Text('No data available.'));
              },
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
