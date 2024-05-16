import 'package:flutter/material.dart';
import 'package:surge_media/main.dart';

import 'package:surge_media/Explore.dart';
import 'package:surge_media/Posts.dart';
import 'package:surge_media/Events.dart';
import 'package:surge_media/Users.dart';

import 'package:flutter/material.dart';

class Hashtags extends StatefulWidget {
  @override
  _HashtagsState createState() => _HashtagsState();
}

class _HashtagsState extends State<Hashtags> {
  String selectedButton = 'Hashtags';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hashtags"),
      ),
      body: Padding(
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
            // Title: Trending Hashtags
            Text(
              "Trending Hashtags",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            // Small Headers
            _buildHashtagType("Type A", "8,811 tags", "Trending in Malaysia"),
            _buildDivider(),
            _buildHashtagType("Type B", "8,812 tags", "Trending in Brunei"),
            _buildDivider(),
            _buildHashtagType("Type C", "8,813 tags", "Trending in China"),
            _buildDivider(),
            _buildHashtagType("Type D", "8,814 tags", "Trending in Singapore"),
            _buildDivider(),
            _buildHashtagType("Type E", "8,815 tags", "Trending in France"),
            _buildDivider(),
            _buildHashtagType("Type F", "8,816 tags", "Trending in Italy"),
            _buildDivider(),
          ],
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

  Widget _buildHashtagType(String type, String tags, String trending) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              tags,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              trending,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Icon(Icons.more_vert, size: 24), // MoreVert icon
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 1,
      height: 20,
    );
  }
}






