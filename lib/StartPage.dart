import 'package:flutter/material.dart';
import 'package:surge_media/main.dart';
import 'package:surge_media/Explore.dart';
import 'package:surge_media/MyProfile.dart';
import 'package:surge_media/EditProfile.dart';
import 'package:surge_media/Settings.dart';
import 'package:surge_media/Notifications.dart';
import 'package:surge_media/Support.dart';






class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        toolbarHeight: 80, // Adjust the height of the AppBar if needed
        centerTitle: true,
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0), // Add padding to move everything to the top
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align children to the top
          children: [
            SizedBox(height: 20), // Adjust spacing as needed
            SizedBox(
              width: 160, // Make the outer circle smaller
              height: 160, // Make the outer circle smaller
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 160, // Make the outer circle smaller
                      height: 160, // Make the outer circle smaller
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
                          image: AssetImage('assets/Refined.jpg'), // Replace 'your_image.jpg' with your image asset path
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Add spacing
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Make the font bolder
            ),
            SizedBox(height: 20), // Add spacing
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black, // Set the background color to black
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuItem('My Profile', context, MyProfile(), Icons.person),
                  _buildMenuItem('Edit Profile', context, EditProfile(), Icons.edit),
                  _buildMenuItem('Settings', context, Settings(), Icons.settings),
                  _buildMenuItem('Notifications', context, Notifications(), Icons.notifications),
                  _buildMenuItem('Support', context, Support(), Icons.support),
                ],
              ),
            ),
            SizedBox(height: 20), // Add spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Explore()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text('Home'),
                ),
                SizedBox(width: 20), // Add some space between the buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text('Sign Out'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, BuildContext context, Widget destinationPage, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => destinationPage));
        },
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4), // Slightly rounded corners
                color: const Color(0xFF716E6E),
              ),
              child: Icon(iconData, color: Colors.white, size: 16), // Add the icon inside the rectangle
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white), // Adding a right side arrow icon
          ],
        ),
      ),
    );
  }
}