import 'package:flutter/material.dart';
import 'package:surge_media/main.dart';

import 'package:surge_media/Explore.dart';
import 'package:surge_media/Hashtags.dart';
import 'package:surge_media/Events.dart';
import 'package:surge_media/Users.dart';
import 'dart:math' as math;



class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  String selectedButton = 'Posts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Stack(
        children: [
          // Positioned Rectangle with Drop Shadow
          Positioned(
            top: 250,
            left: 20,
            right: 20,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildPostItem(
                    'assets/WomanPic1.jpg',
                    'Alice Swole',
                    'assets/MoonStuffs.jpg',
                    'When life gives you lemonade, don’t make lemonade.',
                    '200 comments',
                    'You and 500 others',
                  ),
                  _buildPostItem(
                    'assets/ManPic1.jpg',
                    'John Doe',
                    'assets/SkyGraffiti.jpg',
                    'Enjoying the beautiful sunset!',
                    '150 comments',
                    'You and 300 others',
                  ),
                  // Add more duplicated items here
                ],
              ),
            ),
          ),
          Padding(
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
                      Icon(Icons.search, size: 16), // Magnifying glass icon
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
                // Wrapped Circles with Images and Names
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCircleWithOuterCircle('+', 'You'),
                    SizedBox(width: 8),
                    _buildCircleWithInnerCircle('assets/WomanPic1.jpg', 'Alice Wonder', outerStrokeColor: Colors.blue, innerStrokeColor: Colors.grey),
                    SizedBox(width: 8),
                    _buildCircleWithInnerCircle('assets/ManPic1.jpg', 'Zack Fair', outerStrokeColor: Colors.blue, innerStrokeColor: Colors.grey),
                    SizedBox(width: 8),
                    _buildCircleWithInnerCircle('assets/ManPic1.jpg', 'Cloud Strife', outerStrokeColor: Colors.blue, innerStrokeColor: Colors.grey),
                    SizedBox(width: 8),
                    _buildCircleWithInnerCircle('assets/WomanPic2.jpg', 'Aerith', outerStrokeColor: Colors.grey, innerStrokeColor: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostItem(
      String profileImage,
      String userName,
      String postImage,
      String postText,
      String commentText,
      String likeText,
      ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(profileImage),
              ),
              SizedBox(width: 10),
              Text(
                userName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(height: 10),
          Image.asset(
            postImage,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            postText,
            style: TextStyle(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.comment, color: Colors.grey),
              SizedBox(width: 5),
              Text(
                commentText,
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red),
                  SizedBox(width: 5),
                  Text(
                    likeText,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
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

  Widget _buildCircleWithOuterCircle(String icon, String name) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 2),
              ),
            ),
            Positioned.fill(
              child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 2),
                  color: Colors.transparent,
                ),
                child: icon == '+'
                    ? Center(
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.black,
                  ),
                )
                    : null,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildCircleWithInnerCircle(String image, String name, {Color outerStrokeColor = Colors.transparent, Color innerStrokeColor = Colors.transparent}) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: outerStrokeColor, width: 2),
              ),
            ),
            Positioned.fill(
              child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: innerStrokeColor, width: 2),
                  color: Colors.transparent,
                ),
                child: image != null
                    ? CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(image),
                )
                    : null,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}