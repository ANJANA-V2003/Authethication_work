import 'package:authentication_work/mobile_auth/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Number_Verify extends StatefulWidget {
  const Number_Verify({super.key});

  @override
  State<Number_Verify> createState() => _Number_VerifyState();
}

class _Number_VerifyState extends State<Number_Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250.h,
                  width: 400.w,
                  decoration: BoxDecoration(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter Your Mobile Number",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 22.sp),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "We will send you a confirmation code",
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 60.h),
              child: IntlPhoneField(),
            ),
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Otp_Verification();
                      },
                    ));
                  },
                  child: Container(
                    height: 50.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.purple[500]),
                    child: Center(
                      child: Text(
                        "VERIFY",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
