import 'package:flutter/material.dart';
import 'package:surge_media/main.dart';

class Support extends StatelessWidget {
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
            "Support",
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the image
            Image.asset('assets/SupportIcon.jpg', height: 100.0, width: 100.0),
            SizedBox(height: 16.0),
            // Adding the title
            Text(
              "Hello, how can we help you today?",
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            _buildSupportOption(
              context,
              "Connect Live Chat",
              Icons.arrow_forward_ios,
              () {
                // Handle Connect Live Chat tap
              },
            ),
            SizedBox(height: 16.0),
            _buildSupportOption(
              context,
              "Send Us An Email",
              Icons.arrow_forward_ios,
              () {
                // Handle Send Us An Email tap
              },
            ),
            SizedBox(height: 16.0),
            _buildSupportOption(
              context,
              "FAQS",
              Icons.arrow_forward_ios,
              () {
                // Handle FAQS tap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption(BuildContext context, String text, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
