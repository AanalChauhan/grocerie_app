import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/views/signup/Sign_up.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [_buildLogo, _buildContent(context)]),
    );
  }
}

Widget _buildContent(BuildContext context) => Positioned(
  bottom: 0,
  child: SizedBox(
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(ImageConstant.carroticon),
        _buildTitle(context),
        _buildSubTitle(context),
        _buildGetStarted(context),
      ],
    ),
  ),
);

Widget get _buildLogo => SizedBox(
  height: double.infinity,
  width: double.infinity,
  child: Image.asset(ImageConstant.boardingbg, fit: BoxFit.cover),
);

Widget _buildTitle(BuildContext context) => SizedBox(
  width: 270,
  child: Text(
    "Welcome  to our store",
    style: Theme.of(
      context,
    ).textTheme.titleLarge?.copyWith(color: Colors.white, fontSize: 48),
    textAlign: TextAlign.center,
  ),
);

Widget _buildSubTitle(BuildContext context) => Text(
  "Get your groceries in as fast as one hour",
  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: "Gilroy",
  ),
  textAlign: TextAlign.center,
);

Widget _buildGetStarted(BuildContext context) => Container(
  width: double.infinity,
  height: 60,
  margin: EdgeInsets.symmetric(horizontal: 40),
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
    },
    child: Text(
      "Get Started",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
);
