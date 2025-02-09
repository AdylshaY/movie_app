import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/common/helper/message/display_message.dart';
import 'package:movie_app_clean_architecture/presentation/home/pages/home.dart';

import 'package:reactive_button/reactive_button.dart';

import 'package:movie_app_clean_architecture/data/auth/models/signup_req_params.dart';
import 'package:movie_app_clean_architecture/domain/auth/usecases/signup.dart';
import 'package:movie_app_clean_architecture/service_locator.dart';
import 'package:movie_app_clean_architecture/presentation/auth/pages/sign_in.dart';
import 'package:movie_app_clean_architecture/common/helper/navigation/app_navigation.dart';
import 'package:movie_app_clean_architecture/core/config/theme/app_colors.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async {
        sl<SignUpUseCase>().call(
          params: SignupReqParams(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
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
                AppNavigator.push(context, SignInPage());
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
            _signUpButton(context),
            const SizedBox(height: 20),
            _signupText(context),
          ],
        ),
      ),
    );
  }
}
