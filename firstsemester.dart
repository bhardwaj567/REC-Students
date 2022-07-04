import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstSemester extends StatefulWidget {
  const FirstSemester({Key? key}) : super(key: key);

  @override
  State<FirstSemester> createState() => _FirstSemesterState();
}

class _FirstSemesterState extends State<FirstSemester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("First Semester"),
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
            child: Text("Basic Electric Engineering",
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
            child: Text("Programming For Problem Solving",
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
            child: Text(" Engineering Mathematics-1",
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
            child: Text("Soft Skill",
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
            child: Text("Engineering Chemistry",
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
            child: Text("Artificial Engineering",
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
