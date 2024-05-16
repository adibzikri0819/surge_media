import 'package:flutter/material.dart';
import 'package:surge_media/Users.dart';
import 'package:surge_media/Posts.dart';
import 'package:surge_media/Events.dart';
import 'package:surge_media/Hashtags.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String selectedButton = 'Explore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
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
            // Images Row
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset('assets/RockBand.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset('assets/CrowdMusicParty.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            // Wide Rectangle
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset('assets/Refined.jpg', height: 40, width: 40, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "suffering.eternal223",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "“When a life gives you lemonade, don’t make lemonade.”",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            // Second Images Row
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset('assets/MoonStuffs.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset('assets/SkyGraffiti.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            // Wide Rectangle
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset('assets/ManPic1.jpg', height: 40, width: 40, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "RandomMan123",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "“When a life gives you lemonade, don’t make lemonade. Make strawberries instead because it is sweet”",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        )
      )
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
}

