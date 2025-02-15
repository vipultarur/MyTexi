import 'package:farego/commen/app_colors.dart';
import 'package:farego/widget/round_button.dart';
import 'package:flutter/material.dart';

class AddMoneyView extends StatefulWidget {
  const AddMoneyView({super.key});

  @override
  State<AddMoneyView> createState() => _AddMoneyViewState();
}

class _AddMoneyViewState extends State<AddMoneyView> {
  TextEditingController txtAdd = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtAdd.text = "48";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Add money to wallet",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 12,
              color: Colors.white,
              width: double.maxFinite,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available balance",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "\$54.57",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Icon(Icons.attach_money,color: Colors.green,),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: txtAdd,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Enter Add Wallet Amount",
                        hintStyle: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TagButton(title: "+10", onPressed: () {}),
                  TagButton(title: "+20", onPressed: () {}),
                  TagButton(title: "+50", onPressed: () {}),
                  TagButton(title: "+100", onPressed: () {}),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 12,
              color: Colors.white,
              width: double.maxFinite,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From Bank Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.navigate_next)
                ],
              ),
            ),




            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                itemBuilder: (context, index) {
                  return const BankRow(bObj:{
                    "icon":"assets/images/img_2.png",
                    "name":"Standard Chartered Bank",
                    "number":"**** 3315"
                  } );
                }, separatorBuilder: (context, index) => const Divider(), itemCount: 1),


            Container(
              height: 12,
              color: Colors.white,
              width: double.maxFinite,
            ),
            const SizedBox(
              height: 15,
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundButton(title: "SUBMIT REQUEST", onPressed: (){

              }),
            ),

            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class TagButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TagButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.green, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class BankRow extends StatelessWidget {
  final Map bObj;
  const BankRow({super.key, required this.bObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            bObj["icon"],
            width: 50,
            height: 50,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bObj["name"],
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                Text(
                  bObj["number"],
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}