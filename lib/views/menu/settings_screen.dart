
import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/menu/edit_profile_screen.dart';
import 'package:farego/views/menu/my_vehicle_screen.dart';
import 'package:farego/widget/setting_row.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          SettingRow(
            icon: Icons.brightness_6,
            title: 'Theme',
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Theme Settings
            },
          ),
          const SizedBox(height: 20),
          SettingRow(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {
             context.push(EditProfileScreen());
            },
          ),
           SettingRow(
            icon: Icons.directions_car,
            title: 'My Vehicle',
            onTap: () {
              context.push(MyVehicleScreen());
            },
          ),
           SettingRow(
            icon: Icons.document_scanner,
            title: 'Personal Document',
            onTap: () {
              // Navigate to Profile Settings
            },
          ),
          SettingRow(
            icon: Icons.account_balance,
            title: 'Bank Details',
            onTap: () {
              // Navigate to Profile Settings
            },
          ),
          SettingRow(
            icon: Icons.lock,
            title: 'Change Password',
            onTap: () {
              // Navigate to Change Password
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("HELP",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          SettingRow(
            icon: Icons.perm_identity_rounded,
            title: 'Terms & Condition',
            onTap: () {
              // Navigate to Terms & Conditions
            },
          ),
           SettingRow(
            icon: Icons.perm_identity_rounded,
            title: 'Terms & Condition',
            onTap: () {
              // Navigate to Terms & Conditions
            },
          ),
          SettingRow(
            icon: Icons.call,
            title: 'Contact Us',
            onTap: () {
              // Handle Contact Us
            },
          ),
          SettingRow(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              // Handle logout
            },
          ),

        ],
      ),
    );
  }



}