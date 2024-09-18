import 'package:flutter/material.dart';

class LearningResources extends StatelessWidget {
  const LearningResources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Map of characters to their corresponding image assets
    final Map<String, String> handSigns = {
      'A': 'assets/hand_signs/A.jpg',
      'B': 'assets/hand_signs/B.jpg',
      'C': 'assets/hand_signs/C.jpg',
      'D': 'assets/hand_signs/D.jpg',
      'E': 'assets/hand_signs/E.jpg',
      'F': 'assets/hand_signs/F.jpg',
      'G': 'assets/hand_signs/G.jpg',
      'H': 'assets/hand_signs/H.jpg',
      'I': 'assets/hand_signs/I.jpg',
      'J': 'assets/hand_signs/J.jpg',
      'K': 'assets/hand_signs/K.jpg',
      'L': 'assets/hand_signs/L.jpg',
      'M': 'assets/hand_signs/M.jpg',
      'N': 'assets/hand_signs/N.jpg',
      'O': 'assets/hand_signs/O.jpg',
      'P': 'assets/hand_signs/P.jpg',
      'Q': 'assets/hand_signs/Q.jpg',
      'R': 'assets/hand_signs/R.jpg',
      'S': 'assets/hand_signs/S.jpg',
      'T': 'assets/hand_signs/T.jpg',
      'U': 'assets/hand_signs/U.jpg',
      'V': 'assets/hand_signs/V.jpg',
      'W': 'assets/hand_signs/W.jpg',
      'X': 'assets/hand_signs/X.jpg',
      'Y': 'assets/hand_signs/Y.jpg',
      'Z': 'assets/hand_signs/Z.jpg',
    };

    return Scaffold(
      body: Container(
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30), // Add some space at the top
            Center(
              child: Text(
                'Learning Resources',
                style: TextStyle(
                  fontSize: 27,
                  fontFamily: 'IBMPlexMono',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B4F7D),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: handSigns.length,
                itemBuilder: (context, index) {
                  String letter = handSigns.keys.elementAt(index);
                  String imagePath = handSigns[letter]!;

                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
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
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              imagePath,
                              width: 120, // Increased width
                              height: 120, // Increased height
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 20),
                            Text(
                              letter,
                              style: TextStyle(
                                fontSize: 36,
                                fontFamily: 'IBMPlexMono',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
