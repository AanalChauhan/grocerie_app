import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/views/login/login_screen.dart';
import 'package:grocerie_app/widgets/apptextfield_screen.dart';
import 'package:grocerie_app/widgets/gradient_container.dart';
import 'package:grocerie_app/widgets/styled_button.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientContainer(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    _buildCarrotImg,
                    SizedBox(height: 80),
                    _signuptext(context),
                    SizedBox(height: 10),
                    _subtext(context),
                    SizedBox(height: 30),
                    _buildLabelTextUsername(context),
                    _buildTextFieldName,
                    SizedBox(height: 20),
                    _buildLabelTextEmail(context),
                    _buildTextFieldEmail,
                    SizedBox(height: 20),
                    _buildLabelTextPassword(context),
                   _buildTextFieldPassword,
                    SizedBox(height: 15),
                    _buildRichtextPrivacyPolicy(context),
                    SizedBox(height: 30),
                    _buildButtonSignup(context),
                    SizedBox(height: 18),
                    _buildLoginText(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _signuptext(BuildContext context) =>
      Text("Sign up", style: Theme.of(context).textTheme.titleLarge);
      
  Widget _subtext(BuildContext context) => Text(
    "Enter your credentials to continue",
    style: Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w200),
  );

  Widget _buildLabelTextUsername(BuildContext context) => Text(
    "UserName",
    style: Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColors.subtext,
      fontWeight: FontWeight.w600,
    ),
  );

  Widget get _buildTextFieldName => ApptextfieldScreen(
    controller: nameController,
    keyboardType: TextInputType.text,
    hintText: "Enter your name",
    obsecureText: false,
  );

  Widget _buildLabelTextEmail(BuildContext context) => Text(
    "Email",
    style: Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColors.subtext,
      fontWeight: FontWeight.w600,
    ),
  );

  Widget get _buildTextFieldEmail => ApptextfieldScreen(
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    hintText: "Enter your email",
    obsecureText: false,
  );

  Widget _buildLabelTextPassword(BuildContext context) => Text(
    "Password",
    style: Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColors.subtext,
      fontWeight: FontWeight.w600,
    ),
  );

  Widget get _buildTextFieldPassword => ApptextfieldScreen(
    controller: passwordController,
    keyboardType: TextInputType.emailAddress,
    hintText: "Enter valid password",
    obsecureText: true,
    suffixIcon: Icons.visibility,
  );

  Widget _buildRichtextPrivacyPolicy(BuildContext context) => RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "By continuing you agree to our  ",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.subtext,
            letterSpacing: 0,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
        ),
        TextSpan(
          text: "Terms of Services",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.primary,
            letterSpacing: 0,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
        ),
        TextSpan(
          text: "\nand ",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.subtext,
            letterSpacing: 0,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
        ),
        TextSpan(
          text: "Privacy Policy",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.primary,
            letterSpacing: 0,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    ),
  );

  Widget _buildButtonSignup(BuildContext context) =>
      StyledButton(() {}, "Sign Up");

  Widget _buildLoginText(BuildContext context) => Center(
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account? ",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.textsecondary),
          ),
          TextSpan(
            text: "Login",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
          ),
        ],
      ),
    ),
  );

  Widget get _buildCarrotImg =>
      Center(child: Image.asset(ImageConstant.carrotimg, width: 47));
}
