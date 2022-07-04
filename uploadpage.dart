import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  bool uploading =false;
  double val=0;

  late CollectionReference imgRef;
  late firebase_storage.Reference ref;

  List<File> image = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPLOAD DOCUMENT"),
        actions: [
          IconButton(
            icon: const Icon(Icons.upload_file_rounded),
            tooltip: 'UPLOAD',
            onPressed: () {
              uploadFile().whenComplete(() =>Navigator.of(context).pop());
              setState((){
                uploading=true;
              });
            },
          ),
        ],
      ),
      body: Stack(
      children :[
      GridView.builder(
          itemCount: image.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return index == 0 ?
            Center(
              child: IconButton(
                  icon: Icon(Icons.add),
                onPressed: () {
                  chooseImage();
                }
              ),
            )
                : Container(
                margin: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  image: DecorationImage(image: FileImage(image[index - 1]),
                      fit: BoxFit.fill
                  ),
                )
            );
          }
      ),
        uploading
            ?
          Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text("UPLOADING",
              style: TextStyle(
                fontSize: 20,
              ),
              ),
            ),
            SizedBox( height: 10,),
            CircularProgressIndicator(
              value: val,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ),
        )
        :Container(),
      ]
    )
    );
  }


  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = (await picker.getLostData());
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        image.add(File(response.file!. path));
      });
    }
    else {
      print(response.file);
    }
  }
  Future uploadFile()  async{
    int i=1;

    for(var img in image){
      setState((){
        val =i/image.length;
      });
      ref=firebase_storage.FirebaseStorage.instance.ref()
          .child('images/${Path.basename(img.path)}');

      await ref.putFile(img).whenComplete(() async{
        await ref.getDownloadURL().then((value){
          imgRef.add({'url': value});
          i++;
        });
      });
    }
  }
  @override
  void initState(){
    super.initState();
    imgRef=FirebaseFirestore.instance.collection('imageURLs');
  }
}