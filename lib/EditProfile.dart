import 'package:flutter/material.dart';
import 'package:surge_media/main.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // Controllers for text fields
  final TextEditingController emailController =
      TextEditingController(text: "example123@gmail.com");
  final TextEditingController usernameController =
      TextEditingController(text: "example123");
  final TextEditingController locationController =
      TextEditingController(text: "New York, USA");
  final TextEditingController birthDayController =
      TextEditingController(text: "19/08/1999");
  final TextEditingController idNumberController =
      TextEditingController(text: "1232344243");

  // Variable to store gender selection
  String gender = 'Male';

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
            "Edit Profile",
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
            Row(
              children: [
                SizedBox(
                  height: 160,
                  width: 160,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                              image: AssetImage('assets/Refined.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20), // Add some space between the image and the text
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildProfileTextField("Email", emailController),
            _buildProfileTextField("Username", usernameController),
            _buildProfileGender(),
            _buildProfileTextField("Location", locationController),
            _buildProfileTextField("Birth Day", birthDayController),
            _buildProfileTextField("Identification Number", idNumberController),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTextField(String label, TextEditingController controller) {
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
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildProfileGender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Male'),
                value: 'Male',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Female'),
                value: 'Female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

