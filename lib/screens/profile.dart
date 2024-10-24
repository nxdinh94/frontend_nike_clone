import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:fe_nike/features/authentication/presentation/pages/home_auth.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:fe_nike/util/auth_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/authentication/presentation/bloc/authentication_bloc.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state){
          if(state is AuthInitState){
            Navigator.of(context, rootNavigator: true)
                .pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeAuth()), (route) => false);
          }
        },
        child: Container(
          padding: horizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 80, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              width: 100, height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300]
                              ),
                            ),
                          ),
                          Padding(
                            padding: verticalPadding,
                            child: Text(
                              'Nguyen Xuan Dinh',
                              style: TextStyle(
                                color: colorTextBlack, fontSize: bigger
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: (){},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.grey.shade300)
                            ),
                            child: Text(
                              'Edit profile',
                              style: TextStyle(
                                color: colorTextBlack, fontSize: small
                              ),
                            )
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemWidget(icon: CupertinoIcons.airplane,text: 'Orders',callback: (){},),
                      VerticalDivider( width: 20, thickness: 1, color: Colors.grey[300]),
                      ItemWidget(icon: CupertinoIcons.qrcode, text: 'Pass',callback: (){},),
                      VerticalDivider( width: 20, thickness: 1, color: Colors.grey[300]),
                      ItemWidget(icon: CupertinoIcons.calendar, text: 'Events',callback: (){},),
                      VerticalDivider( width: 20, thickness: 1, color: Colors.grey[300]),
                      ItemWidget(icon: CupertinoIcons.settings, text: 'Settings ',callback: (){
                          // AuthManager.logout();
                          context.read<AuthBloc>().add(
                            AuthLogout(accessToken: AuthManager.readAuth(), refreshToken: AuthManager.readRefreshToken())
                          );
                      },),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {

  final IconData icon;
  final String text;
  final VoidCallback callback;
  const ItemWidget({super.key, required this.icon, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: callback,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 3),
            Text(
              text,
              style: TextStyle(color: colorTextBlack, fontSize: tiny),

            )
          ],
        ),
      ),
    );
  }
}
