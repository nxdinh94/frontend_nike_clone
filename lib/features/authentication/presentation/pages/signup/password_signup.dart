import 'package:fe_nike/core/common/custom_back_page_button.dart';
import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:fe_nike/features/authentication/presentation/pages/home_auth.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/action_near_subtitle.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/agree_term_register.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/header.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/jump_man_and_nike_logo.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/note_password.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/subtitle.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/authentication_state.dart';
import '../../widgets/my_textfield.dart';

class PasswordSignup extends StatefulWidget {
  const PasswordSignup({super.key, required this.email, required this.country});
  final String email;
  final String country;

  @override
  State<PasswordSignup> createState() => _PasswordSignupState();
}

class _PasswordSignupState extends State<PasswordSignup> {

  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  bool isAgreeForSignUpEmail = false;
  bool isAgreeNikePolicy = false;
  bool isShowPassword = false;

  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {
    _codeController.dispose();
    _firstNameController.dispose();
    _surNameController.dispose();
    _passwordController.dispose();
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: const CustomBackPageButton(),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state){
          if(state is RegisterSuccessState){
            context.go(CustomNavigationHelper.homeAuthPath);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const JumpManAndNikeLogo(),
                const Padding(
                  padding: verticalPadding,
                  child: Header(text: "Now let's make you a\nNike Member"),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Subtitle(text: "We've sent a code to\n${widget.email}"),
                    const ActionNearSubtitle(text: 'Edit')
                  ],
                ),
                const SizedBox(height: 24,),
                Row(
                  children: [
                    MyTextfield(
                      flex: 1,
                      hintText: 'Code*',
                      textEditingController: _codeController,
                      icon: CupertinoIcons.refresh,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Resend code in 17s', style: TextStyle(color: colorTextLabelLight, fontSize: tiny),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    MyTextfield(textEditingController: _firstNameController, hintText: 'First Name*', flex: 1),
                    const SizedBox(width: 12,),
                    MyTextfield(textEditingController: _surNameController, hintText: 'SurName*', flex: 1)
                  ],
                ),
                const SizedBox(height: 24),
                //Password term
                Row(
                  children: [
                    MyTextfield(
                      textEditingController: _passwordController,
                      hintText: 'Password*',
                      onTapIcon: (){
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      isObscureText: isShowPassword ? true: null,
                      flex: 1, icon: isShowPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    )
                  ],
                ),
                const SizedBox(height: 12,),
                const Padding(
                  padding: horizontalPadding,
                  child: NotePassword(text: 'Minimum of 8 characters'),
                ),
                const Padding(
                  padding: horizontalPadding,
                  child: NotePassword(text: 'Uppercase, lowercase letters and one number'),
                ),
                const SizedBox(height: 36),
                const Padding(
                  padding: defaultPadding,
                  child: Row(
                    children: [
                      Text('Date of Birth', style: TextStyle(color: colorTextBlack))
                    ],
                  ),
                ),
                Row(
                  children: [
                    MyTextfield(textEditingController: _dayController, hintText: 'Day*', flex: 1),
                    const SizedBox(width: 12,),
                    MyTextfield(textEditingController: _monthController, hintText: 'Month*', flex: 1),
                    const SizedBox(width: 12,),
                    MyTextfield(textEditingController: _yearController, hintText: 'Year*', flex: 2),
                  ],
                ),
                const Padding(
                  padding: horizontalPadding,
                  child: Row(
                    children: [
                      Text(
                        'Get a Nike Member Reward on your birthday.',
                        style: TextStyle(color: colorTextLabelLight, fontSize: tiny),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                AgreeTermRegister(
                    text: 'Sign up for emails to get updates from Nike on products, offers and your Member benefits',
                    flag: isAgreeForSignUpEmail,
                    valueChanged: (bool? value) {
                      setState(() {
                        isAgreeForSignUpEmail = value!;
                      });
                    }
                ),
                const SizedBox(height: 24),
                AgreeTermRegister(
                  text: "I agree to Nike's Privacy Policy and Terms of Use.",
                  flag: isAgreeNikePolicy,
                  valueChanged: (bool? value) {
                    setState(() {
                      isAgreeNikePolicy = value!;
                    });
                  }
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        String name = '${_firstNameController.text.trim()}${_surNameController.text.trim()}';
                        String password = _passwordController.text.trim();
                        String dob = '${_yearController.text.trim()}-${_monthController.text.trim()}-${_dayController.text.trim()}';
                        BodyRegister bodyRegister = BodyRegister(
                            widget.email.trim(),
                            name, password, dob, widget.country.trim()
                        );
                        if(
                        _firstNameController.text.isNotEmpty &&
                            _surNameController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty &&
                            _dayController.text.isNotEmpty &&
                            _monthController.text.isNotEmpty &&
                            _yearController.text.isNotEmpty
                        ){
                          context.read<AuthBloc>().add(AuthRegister(bodyRegister: bodyRegister));
                        }

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24)
                      ),
                      child: const Text(
                        'Create account',
                        style: TextStyle(color: Colors.white, fontSize: small),
                      )
                    )
                  ],
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
