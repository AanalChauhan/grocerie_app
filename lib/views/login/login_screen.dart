import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/views/signup/signup_screen.dart';
import 'package:grocerie_app/widgets/Bottom_navbar.dart';
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
                    _buildTitleLogin(context),
                    SizedBox(height: 5),
                    _buildSubText(context),
                    SizedBox(height: 30),
                    _buildLabelTextEmail(context),
                    _buildTextFieldEmail,
                    SizedBox(height: 20),
                    _buildLabelTextPassword(context),
                    _buildTextFieldPassword,
                    SizedBox(height: 10),
                    _buildtextForgotpassword(context),
                    SizedBox(height: 20),
                    _buildLoginButton(context),
                    SizedBox(height: 18),
                    _buildSignupText(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _buildCarrotImg =>
      Center(child: Image.asset(ImageConstant.carrotimg, width: 47));

  Widget _buildTitleLogin(BuildContext context) =>
      Text("Login", style: Theme.of(context).textTheme.titleLarge);

  Widget _buildSubText(BuildContext context) => Text(
    "Enter your emails and password",
    style: Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w200),
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

  Widget _buildtextForgotpassword(BuildContext context) => Align(
    alignment: Alignment.topRight,
    child: Text(
      "Forgot Password?",
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: AppColors.textsecondary,
        fontWeight: FontWeight.w200,
      ),
    ),
  );

  Widget _buildLoginButton(BuildContext context) => StyledButton(() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavbar()),
    );
  }, "Log In");

  Widget _buildSignupText(BuildContext context) => Center(
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don’t have an account? ",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.textsecondary),
          ),
          TextSpan(
            text: "Signup",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
          ),
        ],
      ),
    ),
  );
}
