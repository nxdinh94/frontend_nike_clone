import 'package:dots_indicator/dots_indicator.dart';
import 'package:fe_nike/core/common/custom_back_page_button.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fe_nike/features/home/products/domain/entites/products.dart';
import 'package:fe_nike/features/product_detail/presentation/bloc/change_favorite/bloc.dart';
import 'package:fe_nike/features/product_detail/presentation/bloc/change_favorite/event.dart';
import 'package:fe_nike/features/product_detail/presentation/bloc/change_favorite/state.dart';
import 'package:fe_nike/features/product_detail/presentation/widgets/bullet_text.dart';
import 'package:fe_nike/features/product_detail/presentation/widgets/image_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductDetail extends StatefulWidget {
  const HomeProductDetail({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<HomeProductDetail> createState() => _HomeProductDetailState();
}

class _HomeProductDetailState extends State<HomeProductDetail> {

  late List<String> totalColorOfProduct;
  late int totalColorOfProductLength;
  late List<dynamic> initialListImage;
  late List<Map<String, dynamic>> selectedListOfImage;
  late String colorShow;
  late bool isFavorite;
  late double currentIndexImage;
  @override
  void initState() {

    context.read<GetFavoriteBloc>().add(GetFavorite(productId: widget.productEntity.id.toString()));

    // List of color keys
    totalColorOfProduct = widget.productEntity.imageList?.keys.toList() as List<String>;
    // get length of totalColorOfProduct
    totalColorOfProductLength = totalColorOfProduct.length;
    // get the first list image
    initialListImage = widget.productEntity.imageList?[totalColorOfProduct[0]];

    colorShow = initialListImage[0]['colorShow'];
    isFavorite = widget.productEntity.isFavourite!;
    currentIndexImage = 0;
    selectedListOfImage = List.generate(totalColorOfProductLength, (index){
      return {
        'index': index,
        'isSelected' : index == 0? true: false
      };
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.productEntity.name}'),
        leading: const CustomBackPageButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    disableCenter: true,
                    viewportFraction: 1,
                    aspectRatio: 9/10,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndexImage = index.toDouble();
                      });
                    },
                  ),
                  items: initialListImage.map((index){
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          index['url'], fit: BoxFit.cover,
                        )
                    );
                  }).toList()
                ),
                //Dots Indicator
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: DotsIndicator(
                        dotsCount: initialListImage.length,
                        position: currentIndexImage,
                        decorator: DotsDecorator(
                          color: Colors.grey.shade300, // Inactive color
                          activeColor: Colors.black87,
                        ),

                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: selectedListOfImage.asMap().entries.map((entry){
                int index = entry.key;
                Map<String, dynamic> item = entry.value;
                return ImageCategory(
                  voidCallback: (){
                    setState(() {
                      selectedListOfImage = List.generate(totalColorOfProductLength, (int index1){
                        return {
                          'index': index1,
                          'isSelected' : index1 == index? true: false
                        };
                      });
                      initialListImage = widget.productEntity.imageList?[totalColorOfProduct[index]];
                      colorShow = initialListImage[0]['colorShow'];
                    });
                  },
                  thumbnail: widget.productEntity.imageList?[totalColorOfProduct[index]][0]['url'],
                  isSelected: item['isSelected']
                );
              }).toList()
            ),
            const SizedBox(height: 24,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productEntity.name.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 1),
                  Text(
                    widget.productEntity.subtitle.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.productEntity.price.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Select size'),
                              SizedBox(width: 6),
                              Icon(Icons.keyboard_arrow_down_rounded, size: 32,)
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text('Add to Bag'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<GetFavoriteBloc, GetFavoriteState>(
                          builder: (context, state){
                            return OutlinedButton(
                              onPressed: (){
                                context.read<GetFavoriteBloc>().add(ChangeFavorite(productId: widget.productEntity.id.toString()));
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Favorite'),
                                  Icon(state.isFavorite ?? false ? CupertinoIcons.suit_heart_fill: CupertinoIcons.heart, size: 24)
                                ],
                              ),
                            );
                          }
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          widget.productEntity.description.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Column(
                    children: [
                      BulletText(text: 'Shown: $colorShow'),
                      BulletText(text: 'Style: ${widget.productEntity.styleCode}'),
                      BulletText(text: 'Country/Region of Origin: ${widget.productEntity.country}'),
                    ],
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
