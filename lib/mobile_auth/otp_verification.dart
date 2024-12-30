import 'package:authentication_work/mobile_auth/otp_success_page.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Container(
                height: 250.h,
                width: 250.w,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage("assets/otp_verify.png"),
                        fit: BoxFit.fill)),
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
            closeKeyboardWhenCompleted: true,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            onCompleted: (value) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Otp_SuccessPage();
                },
              ));
            },
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(fontSize: 20, color: Colors.white),
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          )
        ],
      )),
    );
  }
}
