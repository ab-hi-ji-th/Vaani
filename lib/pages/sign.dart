import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vani/componenets/constant.dart';

import 'package:vani/componenets/model_backend.dart'; // Adjust the import path as necessary

class TextToSign extends StatefulWidget {
  const TextToSign({super.key});

  @override
  State<TextToSign> createState() => _TextToSignState();
}

class _TextToSignState extends State<TextToSign> {
  final timecontroller = TextEditingController();
  final AudioPicker _audioPicker = AudioPicker(); // Instantiate AudioPicker
  String _text = "Select an audio file to transcribe";
  String _filteredText = "";
  int _currentLetterIndex = 0;
  bool _isPlaying = false;
  bool _isPaused = false;
  Timer? _timer;

  Future<void> _displayHandSigns() async {
    _isPlaying = true;
    _isPaused = false;
    _timer = Timer.periodic(Duration(milliseconds: time), (Timer timer) {
      setState(() {
        if (!_isPaused) {
          if (_currentLetterIndex < _filteredText.length - 1) {
            _currentLetterIndex++;
          } else {
            timer.cancel();
            _isPlaying = false;
          }
        }
      });
    });
  }

  Future<void> _pickAndTranscribe() async {
    String transcription = await _audioPicker.pickAndTranscribeFile();
    
    // Process transcription to keep only alphabetic characters and spaces
    _filteredText = transcription.toUpperCase();

    setState(() {
      _text = transcription; // Show the full transcription text normally
      _currentLetterIndex = 0;
      _isPlaying = false;
      _isPaused = false;
      _timer?.cancel();
    });
    
    if (_filteredText.isNotEmpty) {
      _displayHandSigns();
    }
  }

  void _pauseOrResume() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _reset() {
    setState(() {
      _currentLetterIndex = 0;
      _isPlaying = false;
      _isPaused = false;
      _timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Audio File to Text',
          style: TextStyle(
            color: Color(0xFF3B4F7D),
            fontWeight: FontWeight.bold,
            fontFamily: 'IBMPlexMono',
          ),
        ),
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFDCE4F8),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(1.0),
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
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                    child: SingleChildScrollView(
                      child: Text(
                        _text,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'IBMPlexMono',
                          color: Color(0xFF3B4F7D),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                    child: ElevatedButton(
                      onPressed: _pickAndTranscribe, 
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFF9574CD),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),
                        elevation: 0,
                      ),
                      child: Text(
                        'Pick and Transcribe Audio File',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IBMPlexMono',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (_filteredText.isNotEmpty)
                    Container(
                      height: 200,
                      child: Center(
                        child: _buildHandSign(),
                      ),
                    ),
                  if (_isPlaying || _currentLetterIndex > 0) ...[
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                          child: ElevatedButton(
                            onPressed: _pauseOrResume,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFF9574CD),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),
                              elevation: 0,
                            ),
                            child: Text(
                              _isPaused ? 'Resume' : 'Pause',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'IBMPlexMono',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                          child: ElevatedButton(
                            onPressed: _reset,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFF9574CD),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              elevation: 0,
                            ),
                            child: Text(
                              'Stop',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'IBMPlexMono',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Change Image Render Speed',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3B4F7D),
                                  fontFamily: 'IBMPlexMono',
                                ),
                              ),
                              SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 23),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                      ),
                      child: Slider(
                        value: time.toDouble(),
                        min: 100,
                        max: 2000,
                        onChanged: (double newValue) {
                          setState(() {
                            time = newValue.round();
                            timecontroller.text = time.toString();
                          });
                        },
                      ),
                    ),
                    TextFormField(
                                controller: timecontroller,
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                ),
                                
                              ),
                            ],
                          ),
                        ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHandSign() {
    if (_currentLetterIndex >= _filteredText.length) return Container();
    
    String currentCharacter = _filteredText[_currentLetterIndex];
    
    if (RegExp('[A-Z]').hasMatch(currentCharacter)) {
      return Image.asset(
        'assets/hand_signs/$currentCharacter.jpg', // Ensure you have images named A.png, B.png, etc.
        fit: BoxFit.contain,
      );
    } else {
      // Display an empty container for non-alphabetic characters or spaces
      return Container();
    }
  }
}
