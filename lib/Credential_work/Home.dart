import 'package:authentication_work/Credential_work/Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen",style: GoogleFonts.poppins(
          fontSize: 25.sp, color: Colors.purple.shade600)),centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Profilework();
              },));
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: CircleAvatar(radius: 25.r,),
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "You are Logged In",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                  fontSize: 18.sp, color: Colors.purple.shade600),
            ),
          ),
        ],
      ),
    );
  }
}
