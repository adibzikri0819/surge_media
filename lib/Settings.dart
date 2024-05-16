import 'package:flutter/material.dart';
import 'package:surge_media/main.dart';

class Settings extends StatelessWidget {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String selectedLanguage = 'English';
  String selectedMode = 'Light Mode';

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
            "Settings",
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
        child: ListView(
          children: [
            _buildPasswordSection(),
            SizedBox(height: 20),
            _buildDropdownSection("Language", ["Bahasa Melayu", "English", "Mandarin"], selectedLanguage),
            SizedBox(height: 20),
            _buildDropdownSection("Screen Appearance Mode", ["Light Mode", "Dark Mode"], selectedMode),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextFieldSection("Old Password", oldPasswordController, "Enter old password"),
        _buildTextFieldSection("New Password", newPasswordController, "Enter new password"),
        _buildTextFieldSection("Confirm Password", confirmPasswordController, "Confirm password"),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Add your save password logic here
            },
            child: Text("Save Password"),
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldSection(String label, TextEditingController controller, String hintText) {
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
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFFF6F6F6)),
          ),
          child: TextField(
            controller: controller,
            obscureText: true, // To hide the password
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDropdownSection(String label, List<String> items, String selectedValue) {
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
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFFF6F6F6)),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
            onChanged: (String? newValue) {
              selectedValue = newValue!;
              // Add your logic to handle the change in dropdown value here
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}