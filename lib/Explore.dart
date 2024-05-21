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
  List<String> items = List.generate(10, (index) => "Item $index");
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      // Simulate a network call
      await Future.delayed(Duration(seconds: 2));

      List<String> newItems = List.generate(10, (index) => "Item ${items.length + index}");
      setState(() {
        items.addAll(newItems);
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + 1, // +1 for the loading indicator
        itemBuilder: (context, index) {
          if (index == items.length) {
            return isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Box
                if (index == 0) ...[
                  _buildSearchBox(),
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
                ],
                // Items
                _buildImageRow(index),
                SizedBox(height: 12),
                _buildWideRectangle(index),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 16),
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

  Widget _buildImageRow(int index) {
    String image1 = index % 2 == 0 ? 'assets/RockBand.jpg' : 'assets/MoonStuffs.jpg';
    String image2 = index % 2 == 0 ? 'assets/CrowdMusicParty.jpg' : 'assets/SkyGraffiti.jpg';

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(image1, fit: BoxFit.cover),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(image2, fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWideRectangle(int index) {
    String username = index % 2 == 0 ? "suffering.eternal223" : "RandomMan123";
    String imagePath = index % 2 == 0 ? 'assets/Refined.jpg' : 'assets/ManPic1.jpg';
    String quote = index % 2 == 0
        ? "“When a life gives you lemonade, don’t make lemonade.”"
        : "“When a life gives you lemonade, don’t make lemonade. Make strawberries instead because it is sweet”";

    return Container(
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
            child: Image.asset(imagePath, height: 40, width: 40, fit: BoxFit.cover),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  quote,
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
    );
  }
}
