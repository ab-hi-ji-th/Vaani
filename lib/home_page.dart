import 'package:flutter/material.dart';
import 'package:vani/learning_resources.dart';
import 'package:vani/pages/camerapage.dart';
import 'package:vani/pages/chatbot.dart';
import 'package:vani/pages/liveaudio.dart';
import 'package:vani/pages/sign.dart';
import 'package:vani/pages/tits.dart';
import 'SOS_page.dart';
import 'profile_page.dart';
import 'text_to_sign.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFDCE4F8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFDCE4F8).withOpacity(0.8),
                          offset: Offset(-2, -2),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(Icons.menu, color: Color(0xFF3B4F7D), size: 24),
                    ),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hello, Good Morning',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Color(0xFF3B4F7D),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: [
                            buildCard(
                              'TEXT TO SIGN',
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TextInputToSign(),
                                  ),
                                );
                              },
                            ),
                            buildCard(
                              'AUDIO TO SIGN',
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TextToSign(),
                                  ),
                                );
                              },
                            ),
                            buildCard(
                              'VOICE TO SIGN',
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpeechToSign(),
                                  ),
                                );
                              },
                            ),
                            buildCard(
                              'SIGN TO TEXT',
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CameraPage(),
                                  ),
                                );
                              },
                            ),
                            
                            buildCard(
                              'CHATBOT - ASK ME',
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CodeLlamaChatPage(),
                                  ),
                                );
                              },
                            ),
                            buildCard(
                              'LEARNING RESOURCES',  // New Learning Resources card
                                  () {
                                Navigator.push( context, MaterialPageRoute(builder: (context) => LearningResources(),),);
                              },
                            ),
                          ],
                        ),
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
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFFDCE4F8),
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
          iconSize: 28,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (index) {
            if (index == 0) {
              // Navigate to HomePage when home icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            } else if (index == 1) {
              // Navigate to SOSPage when emergency icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SOSPage(),
                ),
              );
            } else if (index == 2) {
              // Navigate to ProfilePage when profile icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emergency),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '', // Remove the text label
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard(String text, VoidCallback onTap) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.8),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(-3, -3),
              ),
              BoxShadow(
                color: Color(0xFFBBC3CE).withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3B4F7D),
                  fontSize: 20,
                  fontFamily: 'IBMPlexMono',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}