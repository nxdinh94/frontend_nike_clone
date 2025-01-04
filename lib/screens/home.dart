import 'package:fe_nike/core/common/item_horizontal_scroll.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/home/products/presentation/bloc/product_bloc.dart';
import 'package:fe_nike/features/profile/me/presentation/bloc/me_states.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:fe_nike/util/auth_manager.dart';
import 'package:fe_nike/util/theme_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../features/home/products/presentation/bloc/product_state.dart';
import '../features/profile/me/presentation/bloc/me_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isAm = true;
  String amOrPm = '';

  @override
  void initState() {
    isAm = DateFormat('hh:mm a').format(DateTime.now()).split(' ').last == 'PM'?  false:true ;
    amOrPm = isAm ? 'Morning' : 'Afternoon';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context); // Access shared instance
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
                onTap: () {
                  AuthManager.logout();
                },
                child: const Icon(CupertinoIcons.search, size: 28)),
          ),
          Switch(
            value: isDarkMode,
            onChanged: (newValue) {
              themeManager.switchMode();  // Toggle theme mode
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title session
            BlocBuilder<MeBloc, MeStates>(
              builder: (context, state){
                String lastName = state.me?.name!.split(' ').last ?? "";
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, right: 24, left: 24),
                  child: Text(
                    'Good $amOrPm $lastName',
                    style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
            // First session
            _recommendedProducts()
          ],
        ),
      ),
    );
  }

  Column _recommendedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top Picks for You', style: Theme.of(context).textTheme.titleMedium),
              GestureDetector(
                onTap: () {
                  context.push(
                      '${CustomNavigationHelper.homePath}/${CustomNavigationHelper.viewAllSlideProductPage}');
                },
                child: Text('View all', style: Theme.of(context).textTheme.labelMedium )
              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 24),
          child: Text('Recommended products', style: Theme.of(context).textTheme.labelLarge),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state is ProductError) {
                return const Center(child: Icon(Icons.refresh));
              }
              if (state is ProductDone) {
                return Row(
                  children: List.generate(state.product!.length, (int index) {
                    return Padding(
                      padding: index != state.product!.length - 1 ? rightPadding : nonePadding,
                      child: Items(productEntity: state.product![index]),
                    );
                  }),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
