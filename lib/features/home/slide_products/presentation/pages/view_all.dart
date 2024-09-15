import 'package:fe_nike/core/constants/font_size.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/custom_back_page_button.dart';
import '../widgets/view_all_items.dart';
class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: const CustomBackPageButton(),
        centerTitle: true,
        title: Text(
          'Top picks for you',
          style: TextStyle(
            fontSize: normal,
            fontWeight: FontWeight.w500
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(Icons.search, size: 30,),
          )
        ],
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          // padding: EdgeInsets.all(12),
          childAspectRatio: 2/3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          children: List.generate(12, (int index){
            return ViewAllItems(index: index,);
          }),

        ),
      ),
    );
  }
}
