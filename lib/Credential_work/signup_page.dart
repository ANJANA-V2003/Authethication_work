import 'package:authentication_work/Credential_work/Home.dart';
import 'package:authentication_work/Credential_work/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_buttons/social_media_icons.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final form_key = GlobalKey<FormState>();
  final namectrl = TextEditingController();
  final mailctrl = TextEditingController();
  final pswctrl = TextEditingController();
  final plcctrl = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void registerUser() async {
    if (form_key.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: mailctrl.text,
          password: pswctrl.text,
        );

        await _firestore
            .collection('CrudUser')
            .doc(userCredential.user!.uid)
            .set({
          'name': namectrl.text,
          'email': mailctrl.text,
          'place': plcctrl.text,
        });

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        ));
      } catch (e) {
        print("Registration Error: $e");
      }
    }
  }

  // String name = '', email = '', password = '', place = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: form_key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, top: 20.h),
                    child: Text(
                      "Hi !",
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
                      "Create a new account",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 22.sp,
                          color: Colors.grey),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 40.h),
                child: TextFormField(
                  controller: namectrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: GoogleFonts.poppins(fontSize: 15.sp)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 40.h),
                child: TextFormField(
                  controller: mailctrl,
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
                padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 40.h),
                child: TextFormField(
                  controller: pswctrl,
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
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 40.h),
                child: TextFormField(
                  controller: plcctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Place",
                      hintStyle: GoogleFonts.poppins(fontSize: 15.sp)),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                onPressed: registerUser,
                child: Text("Register"),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (form_key.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Signup_Page();
                          },
                        ));
                      }
                    },
                    child: Container(
                      height: 50.h,
                      width: 260.w,
                      decoration: BoxDecoration(color: Colors.purple),
                      child: Center(
                        child: Text(
                          "SIGN UP",
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
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text("Already have n account ?",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w400)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Login_Page();
                        },
                      ));
                    },
                    child: Text(
                      "Sign in",
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
    );
  }
}
