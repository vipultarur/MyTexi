import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/auth/otp_screen.dart';
import 'package:farego/widget/black_round_button.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class NumberVerification extends StatefulWidget {
  const NumberVerification({super.key});

  @override
  State<NumberVerification> createState() => _NumberVerificationState();
}

class _NumberVerificationState extends State<NumberVerification> {
  TextEditingController txmobaile=TextEditingController();
  final FlCountryCodePicker flCountryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  @override
  void initState() {
    super.initState();
    countryCode = flCountryCodePicker.countryCodes
        .firstWhere((element) => element.name == "India");
  }

  void pickCountryCode() async {
    final code = await flCountryCodePicker.showPicker(context: context);
    if (code != null) {
      setState(() {
        countryCode = code;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top curved section
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/Ellipse 1.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/Vector (1).png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Welcome text
          Text(
            "Welcome to",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Text(
            "FareGO",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40),
          // Phone number input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
              ),
              child:
              InkWell(
                onTap: () async{
                  final code  =await flCountryCodePicker.showPicker(context: context);
                  if(code !=null){
                    countryCode =code;
                    setState(() {

                    });
                  }
                },
                child:
                Row(
                  children: [
                    GestureDetector(
                      onTap: pickCountryCode,
                      child:
                      Row(
                        children: [
                          countryCode.flagImage(), // Country flag
                          const SizedBox(width: 5),
                          Text(
                            countryCode.dialCode, // Country dial code
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: txmobaile,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "987 654 321",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          BlackRoundButton(
            title: "CONTINUE",
            onPressed: () {
              context.push(const OtpScreen(number: '1234567890', code: '3456',));
            },
          ),
        ],
      ),
    );
  }
}
