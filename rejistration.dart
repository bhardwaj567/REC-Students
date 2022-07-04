
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recstudents/routes.dart';
import 'package:recstudents/user_id.dart';

import 'homescreen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _auth=FirebaseAuth.instance;

  final formkey=GlobalKey<FormState>();
  final  firstNameEditingController= TextEditingController();
  final  lastNameEditingController= TextEditingController();
  final  emailEditingController= TextEditingController();
  final  passwordEditingController= TextEditingController();
  final  confirmpasswordEditingController= TextEditingController();

  @override
  Widget build(BuildContext context) {

    final firstnameField=TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("firstName is Required For SignUp");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name(min.3 character)");
        }
      },
      onSaved: (value){
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "FIRST NAME",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final lastnameField=TextFormField(
      autofocus: false,
      controller: lastNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("last name is Required For SignUp");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid secondName(min.3 character)");
        }
      },
      onSaved: (value){
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "LAST NAME",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final emailField=TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("[a-za-z0-9+_.-]+@[a-za-z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "EMAIL",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final passwordField=TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordEditingController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is Required For Login");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password(min.6 character)");
        }
      },
      onSaved: (value){
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "PASSWORD",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final confirmpasswordField=TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmpasswordEditingController,
      validator: (value) {
       if(confirmpasswordEditingController.text.length>6 && confirmpasswordEditingController.text != value){
         return ("Password don't match");
       }
       return null;
      },
      onSaved: (value){
        confirmpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "CONFIRM PASSWORD",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    final signupButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          SignUp(emailEditingController.text,passwordEditingController.text);
        },
        child: Text("SIGNUP",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      child: Image.asset("image/images2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45),
                    firstnameField,
                    SizedBox(height: 20),
                    lastnameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmpasswordField,
                    SizedBox(height: 20),
                    signupButton,
                    SizedBox(height: 20),

                  ],
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }

  void SignUp(String email, String password) async
  {
    if (formkey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password)
          .then((value) => {
           postDetailsToFirestore(),
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
   }
    postDetailsToFirestore() async{

      FirebaseFirestore firebasefirestore=FirebaseFirestore.instance;
      User? user =_auth.currentUser;

      UserId userId=UserId();

      userId.email=user!.email;
      userId.uid=user!.uid;
      userId.firstName = firstNameEditingController.text;
      userId.secondName=lastNameEditingController.text;

      await firebasefirestore
      .collection("users")
      .doc(user.uid)
      .set(userId.toMap());
      Fluttertoast.showToast(msg: "Account Create Successfully:)");
      Navigator.pushAndRemoveUntil((context),
          MaterialPageRoute(builder: (context)=>HomeScreen()),
              (route) => false);
    }
  }
