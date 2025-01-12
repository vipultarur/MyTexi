
import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/auth/sign_in_screen.dart';
import 'package:farego/widget/black_round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  final String code;
  const OtpScreen({super.key, required this.number, required this.code});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "OTP Verification",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Enter the OTP sent to",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.code} ${widget.number}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(onPressed: (){}, 
                    child: Text('Edit',style: TextStyle(color: Colors.blue,fontSize: 16),)
                )

              ],
            ),
            const SizedBox(height: 30),
            OtpTextField(
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              fieldWidth: 50,
              onCodeChanged: (String code) {
                // Handle validation or checks
              },
              onSubmit: (String verificationCode) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: OtpTimerButton(
                height: 50,
                onPressed: () {
                  // Resend OTP functionality
                },
                text: const Text(
                  'Resend OTP',
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
                buttonType: ButtonType.text_button,
                backgroundColor: Colors.transparent,
                duration: 30, // 30 seconds timer
              ),
            ),
            const SizedBox(height: 20,),
            BlackRoundButton(
              title: "CONTINUE",
              onPressed: () {
                context.push(SignInScreen());
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
