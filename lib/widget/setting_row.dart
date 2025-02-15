import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingRow({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      trailing: trailing ?? const SizedBox.shrink(),
      onTap: onTap,
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Column(
          children: [
            SettingRow(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
