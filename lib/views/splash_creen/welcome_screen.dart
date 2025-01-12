import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/auth/number%20_verification.dart';
import 'package:farego/views/auth/sign_in_screen.dart';
import 'package:farego/views/auth/sign_up_screen.dart';
import 'package:farego/widget/round_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkNavy, // Background color
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/bg.png', // Background image
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.6, // Half the screen height
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/car2.png', // Background image
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5, // Half the screen height
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              Image.asset('assets/images/Vector (1).png',height: 90,width: 90,),
              const Spacer(),
              RoundButton(title: "Sign In", onPressed: (){context.push(const SignInScreen());}),
              const SizedBox(height: 10),
              RoundButton(title: "Sign Up", onPressed: (){context.push(const SignUpScreen());}),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
