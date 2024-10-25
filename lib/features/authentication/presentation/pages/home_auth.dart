import 'package:fe_nike/core/constants/colors.dart';
import 'package:fe_nike/core/constants/font_size.dart';
import 'package:fe_nike/core/constants/padding.dart';
import 'package:fe_nike/features/authentication/presentation/pages/email_page.dart';
import 'package:fe_nike/features/authentication/presentation/pages/signup/password_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAuth extends StatefulWidget {
  const HomeAuth({super.key});

  @override
  State<HomeAuth> createState() => _HomeAuthState();
}

class _HomeAuthState extends State<HomeAuth> {

  final listBg = [
    'assets/background/background1.jpg',
    'assets/background/background2.jpg',
    'assets/background/background3.jpg'
  ];

  String backgroundUrl = '';
  bool flag = true;
  int count = 0;
  @override
  void initState() {
    backgroundUrl = listBg[count];
    // while(flag){
    //   count++;
    //   print(count);
    //   Future.delayed(Duration(seconds: 4), ()=>{
    //     setState(() {
    //       backgroundUrl = listBg[count];
    //     })
    //   });
    //   if(count == 2){
    //     count = -1;
    //   }
    // }
    super.initState();
  }

  @override
  void dispose() {
    flag = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                backgroundUrl
              ),
            fit: BoxFit.cover
          )
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: MediaQuery.of(context).size.width*0.85,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  // backgroundBlendMode: BlendMode.darken,
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.9),
                      spreadRadius:90,
                      blurRadius: 90,
                      offset: Offset(0, 30)
                    ),
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logo-light.svg',
                      width: 90,
                      height: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 12, bottom: 12),
                      child: Text(
                        'Bringing Nike Members \nthe best products, '
                        'inspiration \nand stories in sports.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: extraBigger
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmailPage(),
                                  settings: RouteSettings(
                                    arguments: 'signup'
                                  )
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: normal, color: colorTextBlack)),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24)
                            )
                          ),
                          const SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmailPage(),
                                  settings: RouteSettings(
                                    arguments: 'signin'
                                  )
                                ),
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontSize: normal, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                              side: BorderSide(
                                color: Colors.white,
                                width: 1
                              )
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

