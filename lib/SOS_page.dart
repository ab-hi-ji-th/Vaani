import 'package:flutter/material.dart';

class SOSPage extends StatefulWidget {
  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  bool _isPlaying = false;
  double _playbackProgress = 0.3; // Simulate playback progress for the line

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _rewind() {
    setState(() {
      _playbackProgress = (_playbackProgress - 0.1).clamp(0.0, 1.0);
    });
  }

  void _forward() {
    setState(() {
      _playbackProgress = (_playbackProgress + 0.1).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Heading
                Text(
                  'SOS',
                  style: TextStyle(
                    fontFamily: 'IBMPlexMono', // Font family
                    fontSize: 48,
                    color: Colors.grey.shade700, // Heading font color
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),

                // Circle with 'PLAY' Text
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
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
                    child: Text(
                      'PLAY',
                      style: TextStyle(
                        fontFamily: 'IBMPlexMono', // Font family
                        fontSize: 24,
                        color: Color(0xFF3B4F7D), // Font color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),

                // Playback Progress Line
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearProgressIndicator(
                    value: _playbackProgress,
                    backgroundColor: Colors.white.withOpacity(0.8),
                    color: Color(0xFF3B4F7D), // Line color
                    minHeight: 10,
                  ),
                ),
                SizedBox(height: 40),

                // Control Buttons: Back, Pause/Play, Forward
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Back Button
                    IconButton(
                      iconSize: 40,
                      icon: Icon(
                        Icons.fast_rewind,
                        color: Color(0xFF3B4F7D), // Icon color
                      ),
                      onPressed: _rewind,
                    ),
                    SizedBox(width: 20),

                    // Pause/Play Button
                    IconButton(
                      iconSize: 40,
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Color(0xFF3B4F7D), // Icon color
                      ),
                      onPressed: _togglePlayPause,
                    ),
                    SizedBox(width: 20),

                    // Forward Button
                    IconButton(
                      iconSize: 40,
                      icon: Icon(
                        Icons.fast_forward,
                        color: Color(0xFF3B4F7D), // Icon color
                      ),
                      onPressed: _forward,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
