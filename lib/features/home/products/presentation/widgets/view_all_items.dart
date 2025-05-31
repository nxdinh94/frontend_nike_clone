import 'package:fe_nike/core/constants/my_icons.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/change_favorite_product/presentation/bloc/bloc.dart';
import 'package:fe_nike/features/change_favorite_product/presentation/bloc/event.dart';
import 'package:fe_nike/features/change_favorite_product/presentation/bloc/state.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAllItems extends StatefulWidget {
  const ViewAllItems({super.key, required this.product});
  final ProductEntity product;
  @override
  State<ViewAllItems> createState() => _ViewAllItemsState();
}

class _ViewAllItemsState extends State<ViewAllItems> {
  String thumbnail = '';
  @override
  void initState() {
    context.read<ChangeFavoriteStateBloc>().add(ChangeFavoriteState(productId: widget.product.id.toString()));
    thumbnail = widget.product.imageList?[widget.product.imageList?.keys.toList().first].first['url'] ??'';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(thumbnail,
                height: 180,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name ?? "", style: Theme.of(context).textTheme.titleSmall, overflow: TextOverflow.ellipsis,),
                    Text(widget.product.subtitle?? "", style: Theme.of(context).textTheme.labelSmall),
                    Text(widget.product.price.toString()??"",  style: Theme.of(context).textTheme.bodySmall,)
                  ],
                ),
              )

            ],
          ),
        ),
        //Icon heart
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface
              ),
              child: GestureDetector(
                onTap: (){
                  context.read<ChangeFavoriteStateBloc>().add(ChangeFavoriteState(productId: widget.product.id.toString()));
                },
                child: Builder(
                  builder: (context) {
                    final state = context.watch<ChangeFavoriteStateBloc>().state;
                    return Icon(
                      state.isFavorite ?? false ? MyIcons.heart : MyIcons.heart_empty,
                      size: 20,
                    );
                  }
                )
                ),
              ),
            ),
          ),
      ],
    );
  }
}
