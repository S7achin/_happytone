import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/dashboard.dart';
import 'package:_happytone/src/features/authentication/screens/welcome/welcome_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return const Dashboard();
          }
          // User is NOT logged in
          else {
            return const Welcome();
          }
        }),
      ),
    );
  }
}
