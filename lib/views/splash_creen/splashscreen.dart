import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/auth/chage_language.dart';
import 'package:farego/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
    load();
  }

  void load() async{
    await Future.delayed(const Duration(seconds: 3));
    loadNextScreen();
  }
  void loadNextScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkNavy, // Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Group 1.png",width: 110,height: 110,)
          ],
        ),
        ),
      );
  }
}
