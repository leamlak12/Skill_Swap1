import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_swap/features/home/presentation/pages/home_page.dart';
import 'package:skill_swap/features/auth/presentation/pages/login_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If the snapshot has user data, then they're already signed in
        if (snapshot.hasData) {
          return const HomePage();
        }
        // Otherwise, they're not signed in
        return const LoginPage();
      },
    );
  }
}
