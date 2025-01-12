import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/auth/document_upload_screen.dart';
import 'package:farego/widget/black_round_button.dart';
import 'package:farego/widget/custom_text_field.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class BanckDetailsScreen extends StatefulWidget {
  const BanckDetailsScreen({super.key});

  @override
  State<BanckDetailsScreen> createState() => _BanckDetailsScreenState();
}

class _BanckDetailsScreenState extends State<BanckDetailsScreen> {
  TextEditingController txBankName= TextEditingController();
  TextEditingController txAccountHolderName = TextEditingController();
  TextEditingController txAccountNumber = TextEditingController();
  TextEditingController txIFSCCode = TextEditingController();
  TextEditingController txPassword= TextEditingController();

  final FlCountryCodePicker flCountryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
           Text(
            'Bank Details',
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
                title: "Bank Name",
                controller: txBankName,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                title: "Account Holder Name",
                controller: txAccountHolderName,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                title: "Account Number",
                controller: txAccountNumber,
                keyboardType: TextInputType.text,

              ),
              const SizedBox(height: 10),
              CustomTextField(
                title: "IFSC Code",
                controller: txIFSCCode,
                keyboardType: TextInputType.text,

              ),
              CustomTextField(
                title: "Password",
                controller: txIFSCCode,
                keyboardType: TextInputType.text,
                obscureText: true,
                right: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_sharp, color: AppColors.darkNavy),
                ),
              ),
              const SizedBox(height: 20),
              BlackRoundButton(
                title: "NEXT",
                onPressed: () {
                  context.push(DocumentUploadScreen(title: 'Personal Document'));
                },
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
