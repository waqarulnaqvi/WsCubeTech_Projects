import 'package:expense_app_bloc/core/models/user_model.dart';
import 'package:expense_app_bloc/core/theme/app_colors.dart';
import 'package:expense_app_bloc/features/authentication/pages/sign_up_page.dart';
import 'package:expense_app_bloc/features/authentication/viewmodel/bloc/user_bloc.dart';
import 'package:expense_app_bloc/features/authentication/viewmodel/bloc/user_state.dart';
import 'package:expense_app_bloc/features/onboarding/pages/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/bloc/user_event.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.themeLight,
          centerTitle: false,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    letterSpacing: 1.7,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Sign In and get started",
                style: TextStyle(
                    color: const Color.fromARGB(231, 255, 255, 255),
                    fontSize: 14,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 70,
                    width: w,
                    decoration: BoxDecoration(
                        color: AppColors.themeLight,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(60))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            final emailRegex =
                            RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 10),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 10),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (val) {}),
                                const Text(
                                  "Remember Me",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const Text(
                              "Forget Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                  fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<UserBloc>().add(LoginUserEvent(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Please fill all fields correctly.")),
                          );
                        }

                        // Dispatch your UserEvent here, like:
                        // context.read<UserBloc>().add(UserSignInEvent(...));
                      },
                      child: Card(
                        elevation: 4,
                        child: Container(
                          height: 45,
                          width: w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.themeLight,
                          ),
                          child: BlocConsumer<UserBloc, UserState>(
                            listener: (context, state) {
                              if (state is UserLoggedInState) {
                                print("Hello world");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OnboardingPage(),
                                  ),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Login Successful!")),
                                );
                              }

                              // You can also show SnackBars or Toasts here if needed
                            },
                            builder: (context, state) {
                              return Center(
                                child: state is UserLoadingState
                                    ? CircularProgressIndicator(
                                        color: Colors.white)
                                    : Text(
                                        "Sign In",
                                        style: TextStyle(
                                          letterSpacing: 1.4,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ? ",
                      style: TextStyle(
                          letterSpacing: 1.4,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            letterSpacing: 1.4,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
