import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/auth/document_upload_screen.dart';
import 'package:farego/widget/black_round_button.dart';
import 'package:farego/widget/custom_text_field.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class AddVechicleScreen extends StatefulWidget {
  const AddVechicleScreen({super.key});

  @override
  State<AddVechicleScreen> createState() => _AddVechicleScreenState();
}

class _AddVechicleScreenState extends State<AddVechicleScreen> {
  TextEditingController txServiceType= TextEditingController();
  TextEditingController txBrandName = TextEditingController();
  TextEditingController txModelName = TextEditingController();
  TextEditingController txManufacturer = TextEditingController();
  TextEditingController txNumberPlate= TextEditingController();
  TextEditingController txColor= TextEditingController();

  final FlCountryCodePicker flCountryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
          'Add Vechicle',
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
                title: "Service Type",
                controller: txServiceType,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                title: "Brand Name",
                controller: txBrandName,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                title: "Model ",
                controller: txModelName,
                keyboardType: TextInputType.text,

              ),
              const SizedBox(height: 10),
              CustomTextField(
                title: "Manufacturer",
                controller: txManufacturer,
                keyboardType: TextInputType.text,

              ),
              CustomTextField(
                title: "Number Plate",
                controller: txNumberPlate,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              CustomTextField(
                title: "Color",
                controller: txColor,
                keyboardType: TextInputType.text,
                obscureText: true,

              ),
              const SizedBox(height: 20),
              BlackRoundButton(
                title: "REGISTER",
                onPressed: () {
                  context.push(DocumentUploadScreen(title: 'Vehicle Document'));
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
