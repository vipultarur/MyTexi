import 'package:farego/commen/app_colors.dart';
import 'package:farego/views/menu/add_money_screen.dart';
import 'package:farego/widget/wallet_row.dart';
import 'package:flutter/material.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  final  walletArr = [
    {
      "icon": "assets/images/img.png",
      "name": "Added to Wallet",
      "time": "1 Feb'19 • #123467",
      "price": "\$40"
    },
    {
      "icon": "assets/images/img.png",
      "name": "Trip Deducted",
      "time": "1 Feb'19 • #123467",
      "price": "\$20"
    },
    {
      "icon": "assets/images/img.png",
      "name": "Withdraw to Wallet",
      "time": "1 Feb'19 • #123467",
      "price": "\$15"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        centerTitle: true,
        title: const Text(
          "Wallet",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 12,
              color: Colors.green.shade100,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            const Text(
              "Total Balance",
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "\$",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "54.57",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: isSmallScreen ? 22 : 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.green.shade300, thickness: 0.5),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "WITHDRAW",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 0.5,
                  color: Colors.green,
                  height: 55,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.push(AddMoneyView());
                    },
                    child: const Text(
                      "ADD MONEY",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 12,
              color: Colors.green.shade100,
              width: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.green.shade50,
              width: double.infinity,
              child: const Text(
                "APRIL 2023",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              itemBuilder: (context, index) {
                final wObj = walletArr[index];
                return WalletRow(wObj: wObj);
              },
              separatorBuilder: (context, index) => const Divider(indent: 50),
              itemCount: walletArr.length,
            ),
          ],
        ),
      ),
    );
  }
}
