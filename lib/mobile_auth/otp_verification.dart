import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class Otp_Verification extends StatefulWidget {
  const Otp_Verification({super.key});

  @override
  State<Otp_Verification> createState() => _Otp_VerificationState();
}

class _Otp_VerificationState extends State<Otp_Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 250.h,
              width: 400.w,
              decoration: BoxDecoration(color: Colors.grey),
            )
          ]),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter Verification Code",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 25.sp),
              )
            ],
          ),
          SizedBox(
            height: 60.h,
          ),
          Pinput(
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
              decoration: BoxDecoration(color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(fontSize: 20, color: Colors.white),
              decoration: BoxDecoration(color: Colors.purple[200],
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          )
        ],
      )),
    );
  }
}
