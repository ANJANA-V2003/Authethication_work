import 'package:authentication_work/Credential_work/Home.dart';
import 'package:authentication_work/Credential_work/login_signup.dart';
import 'package:authentication_work/Credential_work/signup_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isloading = false;
  Future<void> signInWithGoogle() async {
    try {
      isloading = true;
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        await _saveUserDataToFirestore(userCredential.user!);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
        isloading = false;
      }
    } catch (error) {
      isloading = false;
      print("Google Sign-In Error: $error");
    }
  }

  Future<void> _saveUserDataToFirestore(User user) async {
    final DocumentSnapshot userDoc =
        await _firestore.collection("CrudUser").doc(user.uid).get();

    if (!userDoc.exists) {
      await _firestore.collection("CrudUser").doc(user.uid).set({
        'name': user.displayName,
        'email': user.email,
        'place': "",
        // Add additional fields like "Trade" and "OfficeLocation" if required
      });
      print("data added");
    }
  }

  final form_key = GlobalKey<FormState>();
  final mailctrl = TextEditingController();
  final pswctrl = TextEditingController();
  void loginUser() async {
    if (form_key.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: mailctrl.text,
          password: pswctrl.text,
        );

        if (userCredential.user != null) {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
           return  Home();
         },));
        }
      } catch (e) {
        print("Login Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return Login_Signup();
                },
              ));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: isloading == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Loading......."),
                  ],
                )
              ],
            )
          : Form(
              key: form_key,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.w, top: 20.h),
                            child: Text(
                              "Welcome !",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 45.sp),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 45.w,
                            ),
                            child: Text(
                              "Sign in to continue",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.sp,
                                  color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 40.w, right: 40.w, top: 60.h),
                        child: TextFormField(controller: mailctrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*required";
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "E-mail",
                              hintStyle: GoogleFonts.poppins(fontSize: 15.sp)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 40.w, right: 40.w, top: 60.h),
                        child: TextFormField(controller: pswctrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*required";
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: GoogleFonts.poppins(fontSize: 15.sp)),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              loginUser();
                            },
                            child: Container(
                              height: 50.h,
                              width: 260.w,
                              decoration: BoxDecoration(color: Colors.purple),
                              child: Center(
                                child: Text(
                                  "LOGIN",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Password ?",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                                color: Colors.deepPurple),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: 120,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "or",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 2,
                            width: 120,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Social Media Login",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login in with google",
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.deepPurple)),
                          SizedBox(
                            width: 20.w,
                          ),

                          IconButton(
                            onPressed: () {
                              signInWithGoogle();
                            },
                            icon: Icon(SocialMediaIcons.google),
                          )

                          // Icon(SocialMediaIcons.facebook,),
                          // SizedBox(
                          //   width: 20.w,
                          // ),
                          // Icon(SocialMediaIcons.twitter),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Text("Don't have n account ?",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Signup_Page();
                                },
                              ));
                            },
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
