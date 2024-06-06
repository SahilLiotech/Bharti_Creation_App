import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenSize.width,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  "assets/images/home_screen_pic.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.01),
              child: Text(
                "Name Plate",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: screenSize.width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
