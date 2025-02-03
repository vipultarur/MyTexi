import 'package:farego/commen/app_colors.dart';
import 'package:farego/widget/switch_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceTypeScreen extends StatefulWidget {
  const ServiceTypeScreen({super.key});

  @override
  State<ServiceTypeScreen> createState() => _ServiceTypeScreenState();
}

class _ServiceTypeScreenState extends State<ServiceTypeScreen> {
  List<Map<String, dynamic>> serviceTypes = [
    {"name": "Executive", "detail": "What is executive", "value": false},
    {"name": "Limo", "detail": "What is limo", "value": true},
    {
      "name": "Economy",
      "detail": "Describe short brief to understand",
      "value": false
    },
  ];

  void handleSwitchChange(int index, bool newValue) {
    setState(() {
      serviceTypes[index]["value"] = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Switch Service Type',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.separated(
        itemCount: serviceTypes.length,
        itemBuilder: (context, index) {
          return SwitchRow(
            serviceObject: serviceTypes[index],
            onSwitchChange: (newValue) => handleSwitchChange(index, newValue),
          );
        },
        separatorBuilder: (context, index) => const Divider(color: Colors.black12),
      ),
    );
  }
}
