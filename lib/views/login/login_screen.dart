import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/widgets/apptextfield_screen.dart';
import 'package:grocerie_app/widgets/gradient_container.dart';
import 'package:grocerie_app/widgets/styled_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientContainer(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Center(
                    child: Image.asset(ImageConstant.carrotimg, width: 47),
                  ),
                  SizedBox(height: 100),
                  Text("Loging", style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 10),
                  Text(
                    "Enter your emails and password",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Email",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.subtext,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  ApptextfieldScreen(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Enter your email",
                    obsecureText: false,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.subtext,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  ApptextfieldScreen(
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Enter valid password",
                    obsecureText: true,
                    suffixIcon: Icons.visibility,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textsecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  StyledButton(() {}, "Log In"),
                  SizedBox(height: 30),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.textsecondary),
                          ),
                          TextSpan(
                            text: "Singup",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
