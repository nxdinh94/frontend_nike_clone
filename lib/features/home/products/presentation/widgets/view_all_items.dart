import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/core/constants/my_icons.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';
import 'package:flutter/material.dart';

import '../../data/model/ProductModel.dart';

class ViewAllItems extends StatefulWidget {
  const ViewAllItems({super.key, required this.product});
  final ProductEntity product;
  @override
  State<ViewAllItems> createState() => _ViewAllItemsState();
}

class _ViewAllItemsState extends State<ViewAllItems> {
  bool isFavourite = false;
  String thumbnail = '';
  @override
  void initState() {
    thumbnail = widget.product.imageList?[widget.product.imageList?.keys.toList().first].first['url'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(thumbnail,
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(''
                      'Nike Sportswear Phoenix Fleece',
                    style: TextStyle(fontSize: tiny, fontWeight: FontWeight.bold),),
                  Text(
                    "Men's T-Shirt",
                    style: TextStyle(fontSize: tiny, color: Colors.grey),
                  ),
                  Text(
                    'đ1.999.999',  style: TextStyle(fontSize: tiny, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )

          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
                child: Icon(
                  isFavourite? MyIcons.heart : MyIcons.heart_empty,
                  size: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
