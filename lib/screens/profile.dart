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
      appBar: AppBar(
        title: Text("Profile screen"),
        actions: [
          GestureDetector(
            onTap: (){
              // AuthManager.logout();
              context.read<AuthBloc>().add(AuthLogout(accessToken: AuthManager.readAuth(), refreshToken: AuthManager.readRefreshToken()));
            },
            child: Icon(
              CupertinoIcons.arrow_right_square_fill, size: 30
            ),
          )
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state){
          if(state is AuthInitState){
            Navigator.of(context, rootNavigator: true)
                .pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeAuth()), (route) => false);
          }
        },
        child: Container(
          child: SizedBox(),
        ),
      ),
    );
  }
}
