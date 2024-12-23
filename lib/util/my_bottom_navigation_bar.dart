import 'package:fe_nike/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/bloc/bloc.dart';
import 'package:fe_nike/features/favorites/favorite_products/presentation/bloc/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int count  = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );

          if(index == 1){
            setState(() {
              count++;
            });
          }
          // refresh ui whenever go through favorite tab
          if(index == 2){
            context.read<FavoriteProductBloc>().add(const GetFavoriteProduct());
          }
        },
        currentIndex: widget.child.currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.manage_search, size: 24),
            label: 'Shop',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 26,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(CupertinoIcons.bag),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            label: 'Bags',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
              size: 28,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
