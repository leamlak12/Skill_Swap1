import 'package:flutter/material.dart';
import 'package:skill_swap/features/auth/presentation/pages/login_page.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              // Welcome Image
              Image.asset(
                'assets/images/lamu.jpg',
                height: 200,
              ),
              const SizedBox(height: 24),
              // Welcome Text
              const Text(
                'Welcome Back !',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Sign Up Text
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              // Username Field
              const CustomTextField(
                icon: Icons.person_outline,
                hintText: 'Username',
              ),
              const SizedBox(height: 16),
              // Email Field
              const CustomTextField(
                icon: Icons.email_outlined,
                hintText: 'Email address',
              ),
              const SizedBox(height: 16),
              // Password Field
              const CustomTextField(
                icon: Icons.lock_outline,
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 8),
              // Remember me and Forgot password
              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Terms and Conditions
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black87),
                  children: [
                    const TextSpan(text: 'By signing youre agree to our '),
                    TextSpan(
                      text: 'Term & Condition',
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Sign Up Button
              CustomButton(
                text: 'Sign Up',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Joined us Before? '),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 