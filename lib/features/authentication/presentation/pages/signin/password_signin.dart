import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/action_near_subtitle.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/header.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/jump_man_and_nike_logo.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/subtitle.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:fe_nike/injection_container.dart';
import 'package:fe_nike/main.dart';
import 'package:fe_nike/screens/home.dart';
import 'package:fe_nike/util/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/custom_back_page_button.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/font_size.dart';
import '../../bloc/authentication_state.dart';
class PasswordSignin extends StatefulWidget {
  const PasswordSignin({super.key, required this.email});

  final String email ;

  @override
  State<PasswordSignin> createState() => _PasswordSigninState();
}

class _PasswordSigninState extends State<PasswordSignin> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _passwordController.text = 'Password1@';
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CustomBackPageButton( ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              JumpManAndNikeLogo(),
              Row(
                children: [
                  Header(text: "What's your password?")
                ],
              ),
              Padding(
                padding: verticalHalfPadding,
                child: Row(
                  children: [
                    Subtitle(text: widget.email),
                    SizedBox(width: 12),
                    ActionNearSubtitle(text: 'Edit')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 20),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)
                    ),
                    filled: true,
                    hintStyle: const TextStyle(color: colorTextGrey),
                    hintText: "Password",
                    fillColor: Colors.white70,
                  ),
                ),
              ),
              Row(
                children: [
                  Text('Forgotten your password?', style: TextStyle(
                    color: colorTextGrey, fontSize: normal, decoration: TextDecoration.underline
                  ),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: ElevatedButton(
                        onPressed: (){
                          context.read<AuthBloc>().add(AuthLogin(email: widget.email, password: _passwordController.text));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24)
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: normal),
                        )
                    ),
                  )
                ],
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccessState) {
                    // Hiển thị CircularProgressIndicator trong 3 giây
                    context.go(CustomNavigationHelper.homePath);
                  }
                },
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthInitState) {
                      return SizedBox();
                    }
                    if (state is AuthErrorState) {
                      return CircularProgressIndicator();
                    }
                    if (state is AuthSuccessState) {
                      // Hiển thị CircularProgressIndicator trong khi đợi
                      return Center(child: CircularProgressIndicator());
                    }
                    return SizedBox(); // or return your default widget here
                  },
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
