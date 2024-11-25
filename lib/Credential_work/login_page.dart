import 'package:authentication_work/Credential_work/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(key: form_key,
        child: SingleChildScrollView(
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
                padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 60.h),
                child: TextFormField(
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
                padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 60.h),
                child: TextFormField(
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
                      if (form_key.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Login_Page();
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
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(color: Colors.grey),
                  )
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
                            fontSize: 12.sp, fontWeight: FontWeight.w400)),
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
    );
  }
}
