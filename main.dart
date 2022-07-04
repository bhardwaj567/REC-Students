import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recstudents/rejistration.dart';
import 'package:recstudents/routes.dart';
import 'package:recstudents/uploadpage.dart';
import 'homescreen.dart';
import 'loginpage.dart';

 Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
       options: FirebaseOptions(
         apiKey: "AIzaSyD6k1f4pLH5HIQnfLOFb2xalLoza_lF9v8",
         appId: "1:847000855275:android:c7f6a681f6269f549e14ae",
         messagingSenderId: "847000855275",
         projectId: "recstudents",
       ),
   );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        backgroundColor: Colors.orange,
          primarySwatch: Colors.cyan,
          fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.abhayaLibreTextTheme()
      ),
       darkTheme: ThemeData(
         brightness: Brightness.dark,
       ),
     routes: {
        "/": (context)=>LoginPage(),
       MyRoutes.homescreenRoute: (context ) => HomeScreen(),
       MyRoutes.registerRoute:(context)=>Register(),
       MyRoutes.uploadpageRoute:(context)=>UploadPage(),

     },

    );
  }
}