import 'package:final_hackathon/api_service.dart';
import 'package:flutter/material.dart';
import 'package:final_hackathon/utils/color.dart';
import 'package:final_hackathon/views/widgets/customElevatedbutton.dart';
import 'package:final_hackathon/views/widgets/customTextFeild.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final APIService apiService = APIService();

  void _signup() async {
    if (_formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match.')),
        );
        return;
      }

      final response = await apiService.createUser({
        'email': emailController.text,
        'password': passwordController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/logo.png"),
                  const SizedBox(height: 20),
                  const Text(
                    "Deliver Your Food",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          labelText: 'Enter your email',
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          labelText: 'Enter your password',
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          labelText: 'Confirm your password',
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          controller: confirmPasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomElevatedButton(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          label: 'Create Account',
                          onPressed: _signup,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("Already have an account?"),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    label: 'Login',
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back to the login screen
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
