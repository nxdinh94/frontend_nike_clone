import 'package:fe_nike/core/common/custom_back_page_button.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/action_near_subtitle.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/header.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/jump_man_and_nike_logo.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/subtitle.dart';
import 'package:fe_nike/helper/custom_navigation_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/my_textfield.dart';
class EmailPage extends StatefulWidget {
  const EmailPage({super.key, required this.fromRequest});
  final String fromRequest;

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController _emailController = TextEditingController();
  bool isEmptyEmail = false;
  String country = 'Viet Nam';

  @override
  void initState() {
    _emailController.text = 'nguyenxuandinh33@gmail.com';
    super.initState();
  }
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: const CustomBackPageButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const JumpManAndNikeLogo(),
              const Header(text: 'Enter your email to join \nus or sign in.'),
              Row(
                children: [
                  Subtitle(text: 'Viet Nam'),
                  const SizedBox(width: 12),
                  ActionNearSubtitle(text: 'Change', callback: (){},)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Row(
                  children: [
                    MyTextfield(
                      textEditingController: _emailController,
                      hintText: 'email',
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "By continue, I agree to Nike's\n" ,
                      style: Theme.of(context).textTheme.labelLarge,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()..onTap= () => print('Tap Here onTap'),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Term Of Use.',
                          style: const TextStyle(decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()..onTap= () => print('Tap Here onTap'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 36.0),
                    child: ElevatedButton(
                      onPressed: ()=>{
                        if(_emailController.text.isNotEmpty){
                          setState(() {
                            isEmptyEmail = false;
                          }),
                          if(widget.fromRequest == 'signup'){
                            context.push(
                              '${CustomNavigationHelper.homeAuthPath}/${CustomNavigationHelper.passwordSignUpPath}',
                              extra: {'country': country, 'email': _emailController.text}
                            )
                          }else {
                            context.push(
                                '${CustomNavigationHelper.homeAuthPath}/${CustomNavigationHelper.passwordSignInPath}',
                                extra: _emailController.text
                            )
                          }
                        }else {
                          setState(() {
                            isEmptyEmail = true;
                          }),
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24)
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: normal),
                      )
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
