import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recstudents/routes.dart';
import 'homescreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
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
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,

          fontStyle: GoogleFonts.aBeeZee().fontStyle,
        ),
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20,15 , 20, 15),
        hintText: "E-MAIL",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is Required For Login");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password(min.6 character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,

          fontStyle: GoogleFonts.aBeeZee().fontStyle,
        ),
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "PASSWORD",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          SignIn(emailController.text, passwordController.text);
        },
        child: Text("LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xffedd3cb),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xffedd3cb),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                     radius: 170,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "image/images.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("DON'T HAVE AN ACCOUNT"),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, MyRoutes.registerRoute);
                          },
                          child: Text("SIGN UP",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }

  void SignIn(String email, String password) async
  {
    if (formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
      {
        Fluttertoast.showToast(msg: "Login successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen())),
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

}