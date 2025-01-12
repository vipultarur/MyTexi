import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/home/home_screen.dart';
import 'package:flutter/material.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  List planarr = [
    {
      "name": "Basic Plan",
      "time": "1 Month",
      "rides": "10 Rides Everyday",
      "cash_rides": "5 Cash rides",
      "km": "50km Travel Rides",
      "price": "TRY FREE"
    },
    {
      "name": "Classic Plan",
      "time": "3 Months",
      "rides": "20 Rides Everyday",
      "cash_rides": "10 Cash rides",
      "km": "80km Travel Rides",
      "price": "BUY AT \$20.50"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscription Plan',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
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
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: planarr.length,
          itemBuilder: (context, index) {
            var plan = planarr[index] as Map<String, dynamic>;
            return PlanCard(plan: plan);
          },
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final Map<String, dynamic> plan;

  const PlanCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plan['name'] ?? '',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Duration: ${plan['time']}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Text(
              'Daily Rides: ${plan['rides']}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Text(
              'Cash Rides: ${plan['cash_rides']}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Text(
              'Distance Limit: ${plan['km']}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  context.push(HomeScreen());
                },
                child: Text(
                  plan['price'] ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
