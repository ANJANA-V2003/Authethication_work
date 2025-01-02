import 'package:authentication_work/Credential_work/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Photo

            const SizedBox(height: 20),
            // Display Email
            Text(
              user?.email ?? 'No Email Available',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            // Logout Button
            ElevatedButton.icon(
              onPressed: () => _logout(context),
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
