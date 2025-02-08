import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:reactive_button/reactive_button.dart';

import 'package:movie_app_clean_architecture/presentation/auth/pages/sign_in.dart';
import 'package:movie_app_clean_architecture/common/helper/navigation/app_navigation.dart';
import 'package:movie_app_clean_architecture/core/config/theme/app_colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  Widget _signInText() {
    return const Text(
      'Sign Up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _signInButton() {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Already have account?"),
          TextSpan(
            text: ' Sign In',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, const SignInPage());
              },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 60),
            _signInButton(),
            const SizedBox(height: 20),
            _signupText(context),
          ],
        ),
      ),
    );
  }
}
