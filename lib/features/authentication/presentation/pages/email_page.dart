import 'package:fe_nike/core/common/custom_back_page_button.dart';
import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Enter your email to join \nus or sign in.',
                    style: TextStyle(color: colorTextBlack, fontSize: 30, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                children: [
                  Text('Vietnam', style: TextStyle(color: colorTextBlack,fontWeight: FontWeight.w500, fontSize: normal)),
                  SizedBox(width: 12),
                  Text('Change', style: TextStyle(color: colorTextGrey,decoration: TextDecoration.underline, fontSize: normal) )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: TextField(
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
                    hintText: "Email",
                    fillColor: Colors.white70,
                  ),
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
                      onPressed: ()=>{},
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
