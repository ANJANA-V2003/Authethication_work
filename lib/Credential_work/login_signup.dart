import 'package:authentication_work/Credential_work/login_page.dart';
import 'package:authentication_work/Credential_work/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_Signup extends StatefulWidget {
  const Login_Signup({super.key});

  @override
  State<Login_Signup> createState() => _Login_SignupState();
}

class _Login_SignupState extends State<Login_Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350.h,
                width: 350.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/login_signup.png"))),
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello !",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 40.sp),
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Best place to write life stories and",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Colors.grey),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "share your journey experiences",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Login_Page();
                    },
                  ));
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
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Signup_Page();
                    },
                  ));
                },
                child: Container(
                  height: 50.h,
                  width: 260.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  child: Center(
                    child: Text(
                      "SIGNUP",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
