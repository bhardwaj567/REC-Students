import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recstudents/routes.dart';
import 'maindrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: Text("REC BIJNOR",
        style: TextStyle(
          fontSize: 30,
          fontStyle: GoogleFonts.aBeeZee().fontStyle,
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.uploadpageRoute);
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('imageURLs').snapshots(),
        builder: ( context,  AsyncSnapshot snapshot) {
          return !snapshot.hasData
            ?
            Center(
            child: CircularProgressIndicator(),
          )
              :Container(
            child: GridView.builder(
                itemCount: snapshot.data.documents.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context , int index){
                  return Container(
                    margin: EdgeInsets.all(3),
                    child: FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                      image: snapshot.data.documents[index].get('url'),
                    ),
                  );
                }
            ),
          );
        },

      ),

      drawer: MainDrawer(),
    );
  }
}

