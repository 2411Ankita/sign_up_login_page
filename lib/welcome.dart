import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> imageList = [
    "assets/chicago_skyline.png",
    "assets/cloud_gate.jpg",
    "assets/field_museum.jpg",
    "assets/navy_pier.jpg",
    "assets/Willis_tower.jpg",
  ];

  void _nextPage() {
    if (_currentIndex < imageList.length - 1) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _prevPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screenHeight = MediaQuery.of(context).size.height * 0.4; // Adjust height as needed

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to CHICAGO',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.pink),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Let's explore the city together!",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black87),
          ),
          SizedBox(height: 20),

          // Image Slider
          Stack(
            children: [
              SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imageList[index],
                        fit: BoxFit.contain, // Ensures the full image is visible without cropping
                        width: screenWidth,
                        height: screenHeight,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned(
                    left: 10,
                    bottom: 100,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_rounded, size: 30, color: Colors.black),
                      onPressed: _prevPage,
                    ),
                  ),
                  Positioned(
                right: 10,
                bottom: 100,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_rounded, size: 30, color: Colors.black),
                  onPressed: _nextPage,
                ),
              ),
            ],
          ),

              // Right Arrow
              
          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return Container(
                width: _currentIndex == entry.key ? 12.0 : 8.0,
                height: _currentIndex == entry.key ? 12.0 : 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key ? Colors.blue : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
