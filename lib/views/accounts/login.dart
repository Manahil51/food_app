import 'package:final_hackathon/views/home/homevie.dart';
import 'package:flutter/material.dart';
import 'package:final_hackathon/utils/color.dart';
import 'package:final_hackathon/views/accounts/signup.dart';
import 'package:final_hackathon/views/widgets/customElevatedbutton.dart';
import 'package:final_hackathon/views/widgets/customTextFeild.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Deliver Your Food",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300, // Adjust the width as needed
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    border: Border.all(color: Colors.grey), // Optional border
                    color:
                        Colors.white, // Background color for the form container
                  ),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "Login",
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
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              // Handle forget password action
                            },
                            child: const Text(
                              "Forget Password",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomElevatedButton(
                        textColor: Colors.white,
                        backgroundColor: Colors.black,
                        label: '     Login    ',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text("or"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center icons
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: const Icon(Icons.g_mobiledata),
                              onPressed: () {},
                              color: Colors.black,
                              iconSize: 60,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: const Icon(Icons.apple),
                              onPressed: () {},
                              color: Colors.black,
                              iconSize: 50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text("Don't Have an account?"),
                SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                  label: 'Register',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
