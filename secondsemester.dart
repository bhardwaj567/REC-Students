import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondSemester extends StatefulWidget {
  const SecondSemester({Key? key}) : super(key: key);

  @override
  State<SecondSemester> createState() => _SecondSemesterState();
}

class _SecondSemesterState extends State<SecondSemester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Second Semester"),
        shadowColor: Colors.grey,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,

            ),
            padding: EdgeInsets.only(top: 50, left: 50),
            child: InkWell(
              child: Text(" Engineering Physics",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
              ),
              onTap: () => launch("https://drive.google.com/file/d/1N8W-T5jV41O0CvQJNawTNLPXL8SJXcai/view?usp=sharing"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 50),
            child: InkWell(
              child: Text("Engineering Mathmatics-2",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
              ),
              onTap: () => launch("https://drive.google.com/file/d/1Bhc9OXZeeK9M7CZ827pao_dSFIcj_0JF/view?usp=sharing"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 50),
            child: InkWell(
              child: Text(" Mechatronics ",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
              ),
              onTap: () => launch("https://drive.google.com/file/d/13Q-XI053i2rbYR7JVhGD-uZrPovqIexq/view?usp=sharing"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 50),
            child: InkWell(
              child: Text("Soft Skill-2",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
              ),
              onTap: () => launch("https://youtu.be/3ct0CjGFW5U"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 50),
            child: InkWell(
              child: Text("Electronics",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
              ),
              onTap: () => launch("https://drive.google.com/file/d/1-3bOAqwhvdXeEb9I4naHOkETHKtIQ4W7/view?usp=sharing"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 50),
            child: InkWell(
              child: Text("Emerging Technology",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
              ),
              onTap: () => launch("https://youtu.be/3ct0CjGFW5U"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 50),
            child: InkWell(
              child: Text("YOUTUBE REFRENCES",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
              ),
              onTap: () => launch("https://youtu.be/3ct0CjGFW5U"),
            ),
          ),
        ],
      ),
    );
  }
}
