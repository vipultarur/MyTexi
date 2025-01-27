
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchRow extends StatelessWidget {
  final Map<String, dynamic> serviceObject;
  final Function(bool) onSwitchChange;

  const SwitchRow({
    super.key,
    required this.serviceObject,
    required this.onSwitchChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceObject["name"] ?? "",
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  serviceObject["detail"] ?? "",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: serviceObject["value"] ?? false,
            onChanged: onSwitchChange,
          ),
        ],
      ),
    );
  }
}
