import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Otp_SuccessPage extends StatefulWidget {
  const Otp_SuccessPage({super.key});

  @override
  State<Otp_SuccessPage> createState() => _Otp_SuccessPageState();
}

class _Otp_SuccessPageState extends State<Otp_SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/success_logo.jpg"),
                          fit: BoxFit.fill)),
                ),
              ),
            )
          ]),
          SizedBox(
            height: 50.h,
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Verification Completed",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 25.sp),
                  )
                ],
              ),
        ])));
  }
}
