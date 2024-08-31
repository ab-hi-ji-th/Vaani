import 'package:flutter/material.dart';

class TextToSignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF9CB2E4).withOpacity(0.6),
                  Color(0xFF9CB2E4).withOpacity(0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Main content
          Column(
            children: [
              // Gradient AppBar
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF9CB2E4).withOpacity(0.6),
                      Color(0xFF9CB2E4).withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: AppBar(
                  backgroundColor: Colors.transparent, // Transparent AppBar
                  elevation: 0, // Remove shadow
                  leading: IconButton(
                    icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.menu, color: Color(0xFF3B4F7D)),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Handle navigation
                    },
                  ),
                ),
              ),
              // Page body
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search bar with blurred edges
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 16, // Increase blur radius
                              spreadRadius: 4, // Slight spread for a softer edge
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Search',
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.transparent, // Make fill color transparent to show box shadow
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Buttons with blurred edges
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 16, // Increase blur radius
                                      spreadRadius: 4, // Slight spread for a softer edge
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Detect action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Color(0xFF9574CD),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 16), // Increase height
                                    elevation: 0, // Remove default elevation
                                  ),
                                  child: Text(
                                    'Detect',
                                    style: TextStyle(
                                      fontSize: 22, // Increase text size
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 16, // Increase blur radius
                                      spreadRadius: 4, // Slight spread for a softer edge
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Refresh action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Color(0xFF9574CD),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 16), // Increase height
                                    elevation: 0, // Remove default elevation
                                  ),
                                  child: Text(
                                    'Refresh',
                                    style: TextStyle(
                                      fontSize: 22, // Increase text size
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '', // Empty label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '', // Empty label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '', // Empty label
            ),
          ],
          selectedItemColor: Color(0xFF3B4F7D), // Change the selected item color if needed
          unselectedItemColor: Colors.grey, // Change the unselected item color if needed
        ),
      ),
    );
  }
}
