import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/home/slide_products/presentation/widgets/items.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              onTap: () {

              },
              child: const Icon(CupertinoIcons.search, size: 28)
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title session
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0, right: 24, left: 24),
              child: Container(
                child: Text('Good Afternoon Nguyen', style: TextStyle(
                  fontSize: extraBigger,
                  fontWeight: FontWeight.bold
                )),
              ),
            ),
            //First session
            _recommendedProducts()
          ],
        ),
      ),
    );
  }

  Container _recommendedProducts() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Top Picks for You', style: TextStyle(fontSize: normal),),
                GestureDetector(
                  onTap: (){
                    CustomNavigationHelper.router.push(
                      '${CustomNavigationHelper.homePath}/${CustomNavigationHelper.viewAllSlideProductPage}'
                    );
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(color: colorTextGrey, fontSize: small)
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24.0, bottom: 24),
            child: Text('Recommended products', style: TextStyle(
              fontSize: normal, color: colorTextGrey
            )),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: List.generate(10, (int index){
                return Padding(
                  padding: index != 9? rightPadding: nonePadding,
                  child: Items(),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
