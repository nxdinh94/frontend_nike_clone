import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/action_near_subtitle.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/header.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/jump_man_and_nike_logo.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/my_textfield.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/subtitle.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/custom_back_page_button.dart';
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
  bool isShowPassword = true;
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
      appBar: AppBar(
        leading: const CustomBackPageButton( ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const JumpManAndNikeLogo(),
              const Header(text: "What's your password?"),
              Padding(
                padding: verticalHalfPadding,
                child: Row(
                  children: [
                    Subtitle(text: widget.email),
                    const SizedBox(width: 12),
                    ActionNearSubtitle(text: 'Edit', callback: (){

                    },)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 20),
                child: Row(
                  children: [
                    MyTextfield(
                      textEditingController: _passwordController,
                      hintText: 'Password',
                      isObscureText: isShowPassword,
                      onTapIcon: (){
                        setState(() {
                          isShowPassword  = !isShowPassword;
                        });
                      },
                      icon: isShowPassword?CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text('Forgotten your password?', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    decoration: TextDecoration.underline
                  )),
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
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24)
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
