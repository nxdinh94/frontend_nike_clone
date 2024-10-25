import 'package:fe_nike/core/common/custom_back_page_button.dart';
import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/features/authentication/presentation/pages/signin/password_signin.dart';
import 'package:fe_nike/features/authentication/presentation/pages/signup/password_signup.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/action_near_subtitle.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/header.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/jump_man_and_nike_logo.dart';
import 'package:fe_nike/features/authentication/presentation/widgets/subtitle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController _emailController = TextEditingController();
  bool isEmptyEmail = false;

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
    String fromRequest = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: CustomBackPageButton(myfun: ()=> Navigator.pop(context) ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              JumpManAndNikeLogo(),
              Header(text: 'Enter your email to join \nus or sign in.'),
              Row(
                children: [
                  Subtitle(text: 'Viet Nam'),
                  SizedBox(width: 12),
                  ActionNearSubtitle(text: 'Change', callback: (){},)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: isEmptyEmail? Colors.redAccent :  colorTextGrey),
                    hintText: "Email",
                    fillColor: Colors.white70,
                  ),
                  onTapOutside: (PointerDownEvent event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "By continue, I agree to Nike's\n" ,
                      style: TextStyle(color: colorTextGrey, fontSize: normal),
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
                          if(fromRequest == 'signup'){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PasswordSignup(email: _emailController.text))
                            )
                          }else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PasswordSignin(email: _emailController.text))
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
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24)
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
