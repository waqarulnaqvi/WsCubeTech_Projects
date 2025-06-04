import 'package:expense_app_bloc/core/theme/app_colors.dart';
import 'package:expense_app_bloc/features/authentication/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/models/user_model.dart';
import '../viewmodel/bloc/user_bloc.dart';
import '../viewmodel/bloc/user_event.dart';
import '../viewmodel/bloc/user_state.dart';
import '../widgets/custom_text_authentication.dart';
import '../widgets/registration_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isRememberMe = false;
  bool isLoading = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColors.themeLight,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Account',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'Sign up and get started',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
      // PreferredSize( //to make appbar smaller
      //   preferredSize: Size.fromHeight(10.0), // Set your desired height here
      //   child:
      // ),
      body: Stack(
        children: [
          Container(
            width: w,
            height: h,
            padding: EdgeInsets.only(top: 110, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextAuthentication(
                      title: 'Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RegistrationTextField(
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      controller: userNameController,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextAuthentication(

                      title: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RegistrationTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Simple email validation
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextAuthentication(
                      title: 'Phone Number',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RegistrationTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        // Simple phone number validation
                        final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
                        if (!phoneRegex.hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextAuthentication(
                      title: 'Password',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RegistrationTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        // Password validation: at least 6 characters
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isRememberMe,
                            checkColor: Colors.white,
                            activeColor: AppColors.themeLight,
                            onChanged: (bool? value) {
                              setState(() {
                                isRememberMe = value!;
                              });
                            }),
                        Expanded(
                          child: RichText(
                              text: TextSpan(
                                  text: "I agree with the ",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                  children: [
                                TextSpan(
                                    text: "terms & Conditions",
                                    style: TextStyle(color: AppColors.themeLight)),
                                const TextSpan(
                                  text:
                                      " and also the protection of my personal data on this application",
                                ),
                              ])),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BlocListener<UserBloc, UserState>(
                      listener: (context, state) {
                        if (state is UserLoadingState) {
                          setState(() {
                            isLoading = true;
                          });
                        } else if (state is UserSuccessState) {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("User Registered Successfully!!")),
                          );
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => const LoginPage()
                          ));
                        } else if (state is UserFailureState) {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                        }
                      },
                      child: InkWell(
                        onTap: isLoading
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            context.read<UserBloc>().add(
                              RegisterUserEvent(
                                newUser: UserModel(
                                  userName: userNameController.text,
                                  email: emailController.text,
                                  userMobileNumber: phoneController.text,
                                  userPassword: passwordController.text,
                                ),
                              ),
                            );
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please fill all fields correctly.")),
                            );
                          }
                        },
                        child: isLoading
                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(color: Colors.white),
                            const SizedBox(width: 10),
                            SignInRegisterButton(
                              h: 45,
                              w: w*0.4,
                              title: "Loading...",
                            ),
                          ],
                        )
                            : SignInRegisterButton(
                          h: 45,
                          w: w,
                          title: "Sign Up",
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already a Member?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.themeLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: w,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.themeLight,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInRegisterButton extends StatelessWidget {
  final double w, h;
  final String title;

  const SignInRegisterButton(
      {super.key, required this.w, required this.h, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: AppColors.themeLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
