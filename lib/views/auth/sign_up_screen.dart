import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/auth/banck_details_screen.dart';
import 'package:farego/widget/black_round_button.dart';
import 'package:farego/widget/custom_text_field.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txmobaile = TextEditingController();
  TextEditingController FNameController = TextEditingController();
  TextEditingController LNameController = TextEditingController();
  TextEditingController AddController = TextEditingController();
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
        title:   Text(
        'SIGN UP',
        style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
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
        child: SingleChildScrollView( // Added here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                title: "First Name",
                controller: FNameController,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                title: "Last Name",
                controller: LNameController,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                title: "Ex: home no,city ,state",
                controller: AddController,
                keyboardType: TextInputType.text,
                right: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.location_on, color: AppColors.darkNavy),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade300, width: 1.5),
                  ),
                  child: InkWell(
                    onTap: pickCountryCode,
                    child: Row(
                      children: [
                        countryCode.flagImage(),
                        const SizedBox(width: 5),
                        Text(
                          countryCode.dialCode,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        const Icon(Icons.arrow_drop_down, color: Colors.black),
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
              const SizedBox(height: 10),
              CustomTextField(
                title: "Password",
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                right: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_sharp, color: AppColors.darkNavy),
                ),
              ),
              const SizedBox(height: 20),
              BlackRoundButton(
                color: Colors.white,
                backgroundColor: Colors.black,
                title: "SIGN UP",
                onPressed: () {
                  context.push(BanckDetailsScreen());
                },
              ),
              const SizedBox(height: 4),
              Center(
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Already Have Account ?',
                    style: TextStyle(fontSize: 17, color: AppColors.darkNavy),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
