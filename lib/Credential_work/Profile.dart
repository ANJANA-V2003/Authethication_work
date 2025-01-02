import 'package:authentication_work/Credential_work/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profilework extends StatefulWidget {
  const Profilework({super.key});

  @override
  State<Profilework> createState() => _ProfileworkState();
}

class _ProfileworkState extends State<Profilework> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to log out the user
  Future<void> _logout(BuildContext context) async {
    try {
      await _auth.signOut();
      // Navigate to the login screen (adjust route as per your app structure)
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Login_Page();
        },
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }

  Future<Map<String, dynamic>?> fetchUserData() async {
    String uid =
        _auth.currentUser!.uid; //this uid is inbuiltt and stored in auth
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('CrudUser').doc(uid).get();
    return userDoc.data() as Map<String, dynamic>?;
  }

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No user data found"));
          }

          Map<String, dynamic> userData = snapshot.data!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Row(
                            children: [
                              Text(
                                "Name: ${userData['name']}",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( height: 60.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 20.w),
                          child: Row(
                            children: [
                              Text(
                                "Email: ${userData['email']}",
                                style:
                                    TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 20.w),
                          child: Row(
                            children: [
                              Text(
                                "Place: ${userData['place']}",
                                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _logout(context),
                    icon: Icon(Icons.logout,color: Colors.white,),
                    label: Text('Logout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
