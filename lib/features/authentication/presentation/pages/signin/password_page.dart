import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:fe_nike/injection_container.dart';
import 'package:fe_nike/main.dart';
import 'package:fe_nike/screens/home.dart';
import 'package:fe_nike/util/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/custom_back_page_button.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/font_size.dart';
import '../../bloc/authentication_state.dart';
class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key, required this.email});

  final String email ;

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: CustomBackPageButton(myfun: ()=> Navigator.pop(context) ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/logo-dark.svg', width: 70, height: 70,),
                    SvgPicture.asset('assets/svg/basketball_logo_dark.svg', width: 70, height: 70,)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "What's your password?",
                      style: TextStyle(color: colorTextBlack, fontSize: 30),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: verticalHalfPadding,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width *0.6,),
                            child: Text(
                                widget.email,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: colorTextBlack, fontSize: normal)
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Text('Edit', style: TextStyle(color: colorTextGrey,decoration: TextDecoration.underline, fontSize: normal) )
                  ],
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
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pushAndRemoveUntil<void>(
                          context,
                          MaterialPageRoute<void>(builder: (BuildContext context) => const CustomRouter()),
                          ModalRoute.withName('/'),
                        );
                      });
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
      ),
    );
  }
}
