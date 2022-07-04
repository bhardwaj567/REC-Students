

import 'package:flutter/material.dart';

import 'package:recstudents/secondsemester.dart';
import 'package:recstudents/seventhsemester.dart';
import 'package:recstudents/sixthsemester.dart';
import 'package:recstudents/thirdsemester.dart';
import 'apttitude.dart';
import 'eighthsemester.dart';
import 'fifthsemester.dart';
import 'firstsemester.dart';
import 'fourthsemester.dart';
import 'gate.dart';



class MainDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Material(
        color: Colors.blueAccent,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
              text: 'FIRST SEMSTER',
              onCliked: () => SelectedItem(context, 0),
            ),
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
                text: 'SECOND SEMESTER',
              onCliked: () => SelectedItem(context, 1),
            ),
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
                text: 'THIRD SEMESTER',
                onCliked: () => SelectedItem(context, 2),
            ),
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
              text: 'FOURTH SEMESTER',
              onCliked: () => SelectedItem(context, 3),
            ),
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
                text: 'FIFTH SEMESTER',
              onCliked: () => SelectedItem(context, 4),
            ),
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
              text: 'SIXTH SEMESTER',
              onCliked: () => SelectedItem(context, 5),
            ),
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
              text: 'SEVENTH SEMESTER',
              onCliked: () => SelectedItem(context, 6),
            ),
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
              text: 'EIGHT SEMESTER',
              onCliked: () => SelectedItem(context, 7),
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.white70),
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
                text: 'GATE',
              onCliked: () => SelectedItem(context, 8),
            ),
            const SizedBox(height: 20),
            bulidMenuIteam(icon: Icons.star,
                text: 'APTITUDE',
              onCliked: () => SelectedItem(context, 9),
            ),
          ],
        ),
      ),
    );
  }

  Widget bulidMenuIteam({
    required String text,
    required IconData icon,
    VoidCallback? onCliked,
  }) {
    final color = Colors.white;
    final hovercolor = Colors.yellow;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hovercolor,
      onTap: onCliked,
    );
  }

  void SelectedItem(BuildContext context, int index) {

    Navigator.of(context).pop();

    switch (index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FirstSemester(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondSemester(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThirdSemester(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FourthSemester(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FifthSemester(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SixthSemester(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SeventhSemester(),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EighthSemester(),
        ));
        break;

      case 8:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Gate(),
        ));
        break;
      case 9:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Aptitude(),
        ));
        break;
    }
  }
}
