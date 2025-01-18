import 'package:farego/commen/app_colors.dart';
import 'package:farego/widget/black_round_button.dart';
import 'package:farego/widget/custom_text_field.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txmobaile = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text('SIGN IN',style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
            CustomTextField(
              title: "Password",
              controller: passwordController,
              keyboardType: TextInputType.text,
              right: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_sharp,color: AppColors.darkNavy,)),


            ),
            const SizedBox(height: 20),
            BlackRoundButton(
              color: Colors.white,
              backgroundColor: Colors.black,
              title: "CONTINUE",
              onPressed: () {
                // Add your continue button functionality
              },
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(onPressed: (){},
                  child: Text('Forget Password!',style: TextStyle(fontSize: 17,color: AppColors.darkNavy),)
              ),
            )
          ],
        ),
      ),
    );
  }
}
