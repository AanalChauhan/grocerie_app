import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/views/login/login_screen.dart';
import 'package:grocerie_app/views/number_screen.dart';
import 'package:grocerie_app/views/signup/signup_screen.dart';
import 'package:grocerie_app/views/verification_screen.dart';
import 'package:grocerie_app/widgets/dropdown_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(ImageConstant.signinbgimg, fit: BoxFit.cover),
        ),
        SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: _buildcontent(context),
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildcontent(BuildContext context) => Column(
  //   children: [
  //     _buildCountryDropDown(context),
  //     Expanded(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           _buildbodytext(context),
  //           SizedBox(height: 30),
  //           _googlebutton(context),
  //           SizedBox(height: 20),
  //           _fbbutton(context),
  //         ],
  //       ),
  //     ),
  //   ],
  // );
  Widget _buildcontent(BuildContext context) => SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height / 1.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildtitletext(context),
          SizedBox(height: 20),
          DropdownTextfield(),
          SizedBox(height: 30),
          _buildbodytext(context),
          SizedBox(height: 30),
          _googlebutton(context),
          SizedBox(height: 20),
          _fbbutton(context),
        ],
      ),
    ),
  );

  // Widget _buildCountryDropDown(BuildContext context) => Container(
  //   margin: EdgeInsets.all(25),
  //   // color: Colors.blueAccent,
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       _buildtitletext(context),
  //       SizedBox(height: 20),
  //       DropdownTextfield(),
  //     ],
  //   ),
  // );

  Widget _buildtitletext(BuildContext context) => Text(
    "Get your groceries \nwith nectar",
    style: Theme.of(context).textTheme.titleLarge,
  );

  Widget _buildbodytext(BuildContext context) => Center(
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Text(
        "Or Register with email",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ),
  );

  Widget _googlebutton(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 67,

    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NumberScreen()),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF5383EC)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstant.googleicon),
          SizedBox(width: 20),
          Text(
            "Continue with Google",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _fbbutton(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 67,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerificationScreen()),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4A66AC)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstant.fbicon),
          SizedBox(width: 20),
          Text(
            "Continue with Facebook",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
