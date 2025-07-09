import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/views/number_screen.dart';
import 'package:grocerie_app/views/verification_screen.dart';
import 'package:grocerie_app/widgets/dropdown_textfield.dart';
import 'package:grocerie_app/widgets/gradient_container.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [GradientContainer(), _buildcontent(context)]),
    );
  }

  Widget _buildcontent(BuildContext context) => Column(
    children: [
      _buildimg,
      SizedBox(height: 30),
      _buildCountryDropDown(context),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildbodytext(context),
            SizedBox(height: 30),
            _googlebutton(context),
            SizedBox(height: 20),
            _fbbutton(context),
          ],
        ),
      ),
    ],
  );

  Widget _buildCountryDropDown(BuildContext context) => Container(
    margin: EdgeInsets.all(25),
    // color: Colors.blueAccent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildtitletext(context),
        SizedBox(height: 20),
        DropdownTextfield(),
      ],
    ),
  );

  Widget get _buildimg => SizedBox(
    height: 413.37,
    width: double.infinity,
    child: Image.asset(ImageConstant.signinimg, fit: BoxFit.cover),
  );

  Widget _buildtitletext(BuildContext context) => SizedBox(
    width: 222,
    child: Text(
      "Get your groceries with nectar",
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );

  Widget _buildbodytext(BuildContext context) => Text(
    "Or connect with social media",
    style: Theme.of(context).textTheme.bodySmall,
  );

  Widget _googlebutton(BuildContext context) => Container(
    width: double.infinity,
    height: 67,
    margin: EdgeInsets.symmetric(horizontal: 30.5),
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

  Widget _fbbutton(BuildContext context) => Container(
    width: double.infinity,
    height: 67,
    margin: EdgeInsets.symmetric(horizontal: 30.5),
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
