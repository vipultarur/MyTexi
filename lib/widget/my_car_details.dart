import 'package:farego/widget/car_document_row.dart';
import 'package:flutter/material.dart';

class MyCarDetails extends StatelessWidget {
  final Map<String, String> vehicle;
  const MyCarDetails({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(vehicle['name'] ?? 'My Vehicle'),
            Text(vehicle['no_plat'] ?? '',
                style: const TextStyle(fontSize: 15, color: Colors.grey)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarDocumentRow(
                title: "Vehicle Registration",
                date: "Valid",
                status: "APPROVED",
                statusColor: Colors.green,
                onPressed: () {}),
            CarDocumentRow(
                title: "Vehicle Insurance",
                date: "Expires: 31 Dec 2024",
                status: "APPROVED",
                statusColor: Colors.green,
                onPressed: () {}),
            CarDocumentRow(
                title: "Vehicle Permit",
                date: "Expires: 31 Dec 2024",
                status: "APPROVED",
                statusColor: Colors.green,
                onPressed: () {}),
            CarDocumentRow(
                title: "Loan EMI Details",
                date: "Incorrect document type",
                status: "NOT APPROVED",
                statusColor: Colors.red,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
