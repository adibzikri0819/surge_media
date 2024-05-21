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

class Friend {
  String name;
  String imagePath;
  bool requestSent;

  Friend(this.name, this.imagePath, {this.requestSent = false});
}

class _UsersState extends State<Users> {
  String selectedButton = 'Users';

  List<Friend> friends = [
    Friend('Person A', 'assets/Refined.jpg'),
    Friend('Person B', 'assets/MoonStuffs.jpg'),
    Friend('Person C', 'assets/CrowdMusicParty.jpg'),
    Friend('Person D', 'assets/RockBand.jpg'),
    Friend('Person E', 'assets/SkyGraffiti.jpg'),
    Friend('Person F', 'assets/SkyGraffiti.jpg'),
    Friend('Person G', 'assets/SkyGraffiti.jpg'),
    Friend('Person H', 'assets/SkyGraffiti.jpg'),
    Friend('Person I', 'assets/SkyGraffiti.jpg'),
  ];

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
              ...friends.map((friend) => _buildPersonRow(context, friend)).toList(),
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

  Widget _buildPersonRow(BuildContext context, Friend friend) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(friend.imagePath, height: 40, width: 40, fit: BoxFit.cover),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              friend.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8), // Adding space between circular image and buttons
          if (!friend.requestSent) ...[
            _buildActionButton(context, "Add friend", Color(0xFF2646ED), Colors.white, () {
              setState(() {
                friend.requestSent = true;
              });
            }),
            SizedBox(width: 8), // Adding space between buttons
            _buildActionButton(context, "Remove", Color(0xFFF6F6F6), Colors.black, () {
              setState(() {
                friends.remove(friend);
              });
            }),
          ] else ...[
            Column(
              children: [
                Text(
                  "Request sent",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4),
                _buildActionButton(context, "Cancel", Colors.red, Colors.white, () {
                  setState(() {
                    friend.requestSent = false;
                  });
                }),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String title, Color backgroundColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
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