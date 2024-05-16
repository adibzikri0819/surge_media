import 'package:flutter/material.dart';
import 'package:surge_media/main.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String? allowNotifications = 'Yes';
  String? muteNotifications = 'No';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Notifications",
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRadioGroup("Allow Notifications", allowNotifications, (value) {
              setState(() {
                allowNotifications = value;
              });
            }),
            SizedBox(height: 20),
            _buildRadioGroup("Mute Notifications", muteNotifications, (value) {
              setState(() {
                muteNotifications = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioGroup(String label, String? groupValue, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String?>(
                title: const Text('Yes'),
                value: 'Yes',
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: RadioListTile<String?>(
                title: const Text('No'),
                value: 'No',
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}