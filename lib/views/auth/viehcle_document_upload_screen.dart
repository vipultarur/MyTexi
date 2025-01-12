import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/auth/add_vechicle_screen.dart';
import 'package:farego/views/auth/subscription_plan_screen.dart';
import 'package:farego/widget/black_round_button.dart';
import 'package:farego/widget/document_row.dart';
import 'package:flutter/material.dart';

class ViehcleDocumentUploadScreen extends StatefulWidget {
  final String title;
  const ViehcleDocumentUploadScreen({super.key, required this.title});

  @override
  State<ViehcleDocumentUploadScreen> createState() => _ViehcleDocumentUploadScreenState();
}

class _ViehcleDocumentUploadScreenState extends State<ViehcleDocumentUploadScreen> {
  List documentList = [
    {
      "name": "RC Book",
      "details": "Vehicle Registration",
      "info": "",
      "status": DocumentStatus.upload
    },
    {
      "name": "Insurance Policy",
      "details": "A Driving licence is on official do..",
      "info": "",
      "status": DocumentStatus.uploaded
    },
    {
      "name": "Owner Certificate",
      "details": "A Passport is a travel document...",
      "info": "",
      "status": DocumentStatus.upload
    },
    {
      "name": "PUC",
      "details": "Incorrect document type",
      "info": "",
      "status": DocumentStatus.upload
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var dObj = documentList[index] as Map? ?? {};
                    return DocumentRow(
                        dObj: dObj,
                        onPressed: () {},
                        onInfo: () {},
                        onUpload: () {},
                        onAction: () {},
                        Status: dObj["status"] as DocumentStatus? ??
                            DocumentStatus.uploading);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: documentList.length),

              const SizedBox(height: 10),
              BlackRoundButton(
                title: "NEXT",
                onPressed: () {
                  context.push(SubscriptionPlanScreen());
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
