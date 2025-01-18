import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/home/run_ride_screen.dart';
import 'package:farego/widget/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancelReasonScreen extends StatefulWidget {
  const CancelReasonScreen({super.key});

  @override
  State<CancelReasonScreen> createState() => _CancelReasonScreenState();
}

class _CancelReasonScreenState extends State<CancelReasonScreen> {
  String? _selectedReason;

  final List<String> _reasons = [
    "Change of plans",
    "Found a better option",
    "Too expensive",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          context.push(RunRideScreen());
        },
      ),
      title: Text(
        "Cancel Trip",
        style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w800),
      ),
      centerTitle: true,
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please select a reason for canceling:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _reasons.length,
                itemBuilder: (context, index) {
                  return RadioListTile<String>(
                    title: Text(_reasons[index]),
                    value: _reasons[index],
                    groupValue: _selectedReason,
                    activeColor:AppColors.accentColor ,
                    onChanged: (value) {
                      setState(() {
                        _selectedReason = value;
                      });

                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            RoundButton(title: 'Submit', onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
