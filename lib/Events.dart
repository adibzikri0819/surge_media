import 'package:flutter/material.dart';
import 'package:surge_media/main.dart';

import 'package:surge_media/Explore.dart';
import 'package:surge_media/Hashtags.dart';
import 'package:surge_media/Posts.dart';
import 'package:surge_media/Users.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  String selectedButton = 'Events';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
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
              // Title: Available Events
              Text(
                "Available Events",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              // Events List
              _buildEventRow(
                "StravaEvent1.png",
                "Find Your Podium Challenge",
                "StravaBikeIcon.png",
                "Bike a total of 600 km (372.8 mil) in a month",
                "May 1, 2024 to May 31, 2024",
              ),
              SizedBox(height: 12),
              _buildEventRow(
                "StravaEvent2.png",
                "Merrell 'Find The Love. Run Wild'",
                "StravaRunningShoeIcon.png",
                "Log 100 minutes of trail running in 3 weeks.",
                "May 10, 2024 to May 30, 2024",
              ),
              SizedBox(height: 12),
              _buildEventRow(
                "StravaEvent3.png",
                "May Commute Challenge",
                "StravaBikeIcon.png",
                "Bike a total of 600 km (372.8 mil) in a month",
                "May 12, 2024 to May 28, 2024",
              ),
              SizedBox(height: 12),
              _buildEventRow(
                "StravaEvent4.png",
                "May Random Challenge",
                "StravaBikeIcon.png",
                "Bike a total of 600 km (372.8 mil) in a month",
                "May 1, 2024 to May 31, 2024",
              ),
              SizedBox(height: 12),
              // Horizontal Line
              Divider(color: Colors.white),
              SizedBox(height: 12),
              // Title: Upcoming Events
              Text(
                "Upcoming Events",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              // Events List
              _buildEventRow(
                "StravaEvent1.png",
                "Find Your Podium Challenge",
                "StravaBikeIcon.png",
                "Bike a total of 600 km (372.8 mil) in a month",
                "May 1, 2024 to May 31, 2024",
              ),
              SizedBox(height: 12),
              _buildEventRow(
                "StravaEvent2.png",
                "Merrell 'Find The Love. Run Wild'",
                "StravaRunningShoeIcon.png",
                "Log 100 minutes of trail running in 3 weeks.",
                "May 10, 2024 to May 30, 2024",
              ),
               SizedBox(height: 12),
              _buildEventRow(
                "StravaEvent3.png",
                "May Commute Challenge",
                "StravaBikeIcon.png",
                "Bike a total of 600 km (372.8 mil) in a month",
                "May 12, 2024 to May 28, 2024",
              ),
              SizedBox(height: 12),
              _buildEventRow(
                "StravaEvent4.png",
                "May Random Challenge",
                "StravaBikeIcon.png",
                "Bike a total of 600 km (372.8 mil) in a month",
                "May 1, 2024 to May 31, 2024",
              ),
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

  Widget _buildEventRow(String eventImage, String eventName, String iconImage, String description, String dateRange) {
    return Row(
      children: [
        Image.asset('assets/$eventImage', height: 80, width: 80), // Event Image
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Image.asset('assets/$iconImage', height: 20, width: 20), // Icon Image
                  SizedBox(width: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                dateRange,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}