import 'package:flutter/material.dart';
import 'package:surge_media/main.dart';

import 'package:surge_media/Explore.dart';
import 'package:surge_media/Posts.dart';
import 'package:surge_media/Events.dart';
import 'package:surge_media/Hashtags.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  String selectedButton = 'Users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: SingleChildScrollView(
        child: Padding(
padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Box
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, size: 16), // Reduced size of the search icon
                  SizedBox(width: 8),
                  Text(
                    "Search Anything",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton(context, 'Explore'),
                _buildButton(context, 'Users'),
                _buildButton(context, 'Hashtags'),
                _buildButton(context, 'Posts'),
                _buildButton(context, 'Events'),
              ],
            ),
            SizedBox(height: 12),
            // Horizontal Line
            Divider(color: Colors.grey),
            SizedBox(height: 12),
            // People You May Know
            Text(
              "People You May Know",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            // People List
            _buildPersonRow(context, 'Person A', 'assets/Refined.jpg'),
            SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person B', 'assets/MoonStuffs.jpg'),
            SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person C', 'assets/CrowdMusicParty.jpg'),
            SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person D', 'assets/RockBand.jpg'),
            SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person E', 'assets/SkyGraffiti.jpg'),
             SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person F', 'assets/SkyGraffiti.jpg'),
             SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person G', 'assets/SkyGraffiti.jpg'),
             SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person H', 'assets/SkyGraffiti.jpg'),
             SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person I', 'assets/SkyGraffiti.jpg'),
            _buildPersonRow(context, 'Person D', 'assets/RockBand.jpg'),
            SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person E', 'assets/SkyGraffiti.jpg'),
             SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person F', 'assets/SkyGraffiti.jpg'),
             SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person G', 'assets/SkyGraffiti.jpg'),
             SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person H', 'assets/SkyGraffiti.jpg'),
             SizedBox(height: 8), // Adding space between rows
            _buildPersonRow(context, 'Person I', 'assets/SkyGraffiti.jpg'),
          ],
        ),
        ),
      ),
      
    );
  }

  Widget _buildButton(BuildContext context, String title) {
    bool isSelected = selectedButton == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButton = title;
        });

        // Navigate to respective pages
        switch (title) {
          case 'Explore':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Explore()),
            );
            break;
          case 'Users':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Users()),
            );
            break;
          case 'Hashtags':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Hashtags()),
            );
            break;
          case 'Posts':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Posts()),
            );
            break;
          case 'Events':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Events()),
            );
            break;
        }
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.blue : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 2,
              width: 20,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }

  Widget _buildPersonRow(BuildContext context, String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(imagePath, height: 40, width: 40, fit: BoxFit.cover),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8), // Adding space between circular image and buttons
          _buildActionButton(context, "Add friends", Color(0xFF2646ED), Colors.white),
          SizedBox(width: 8), // Adding space between buttons
          _buildActionButton(context, "Remove", Color(0xFFF6F6F6), Colors.black),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String title, Color backgroundColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        // Add your button action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        textStyle: TextStyle(
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(title),
    );
  }
}