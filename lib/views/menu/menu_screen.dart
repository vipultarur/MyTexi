import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/menu/earning_screen.dart';
import 'package:farego/views/menu/service_type_screen.dart';
import 'package:farego/widget/gray_liable_colum_box.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Profile picture and name
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.edit, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Star Icon
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  // Rating Text
                  Text(
                    '4.5', // Show one decimal place
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            "Esther Howard",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GrayLiableColumBox(
                onPressed: () {
                  context.push(EarningScreen());
                },
                icon: Icon(Icons.bar_chart_outlined, color: Colors.green.shade600),
                title: "Earnings",
                backgroundColor: Colors.green.shade100,
              ),
              GrayLiableColumBox(
                onPressed: () {},
                icon: Icon(Icons.account_balance_wallet, color: Colors.blue.shade700),
                title: "Wallet",
                backgroundColor: Colors.blue.shade100,
              ),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
              onTap: () {
                context.push(ServiceTypeScreen());
              },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.directions_car, color: Colors.black,size: 50,),
                  Column(
                    children: [
                      Text(
                        "Switch Service Type",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Change Your Service Type",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // List of menu items
          Expanded(
            child: ListView(
              children: const [
                // ProfileMenuItem(
                //   icon: Icons.person,
                //   title: "Your profile",
                // ),
                ProfileMenuItem(
                  icon: Icons.home_rounded,
                  title: "Home",
                ),
                ProfileMenuItem(
                  icon: Icons.notifications,
                  title: "Notification",
                ),
                ProfileMenuItem(
                  icon: Icons.settings,
                  title: "Settings",
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  title: "Logout",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileMenuItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {},
    );
  }
}
