import 'package:flutter/material.dart';
import 'package:farego/widget/my_car_details.dart';
import 'package:farego/widget/my_car_row.dart';
import 'package:farego/widget/round_button.dart';

class MyVehicleScreen extends StatefulWidget {
  const MyVehicleScreen({super.key});

  @override
  State<MyVehicleScreen> createState() => _MyVehicleScreenState();
}

class _MyVehicleScreenState extends State<MyVehicleScreen> {
  final List<Map<String, String>> vehicles = [
    {
      "name": "Toyota Prius",
      "no_plat": "AB 1234",
      "image": "assets/images/toyota.png"
    },
    {
      "name": "Honda Civic",
      "no_plat": "CD 5678",
      "image": "assets/images/toyota.png"
    },
    {
      "name": "Tesla Model 3",
      "no_plat": "EF 9101",
      "image": "assets/images/toyota.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('My Vehicles')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: vehicles.length,
              separatorBuilder: (_, __) => const Divider(height: 0.5),
              itemBuilder: (context, index) => MyCarRow(
                cObj: vehicles[index],
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MyCarDetails(vehicle: vehicles[index])),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: RoundButton(title: "Add A VEHICLE", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
