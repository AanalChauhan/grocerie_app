import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/views/sign_in.dart';
import 'package:grocerie_app/widgets/styled_button.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [_buildLogo(context), _buildContent(context)]),
    );
  }
}

Widget _buildContent(BuildContext context) => Positioned(
  bottom: 0,
  child: SizedBox(
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(height: 40),
        Image.asset(ImageConstant.carroticon, height: 56, width: 48),
        SizedBox(height: 20),
        _buildTitle(context),
        // SizedBox(height: 4),
        _buildSubTitle(context),
        SizedBox(height: 40),
        StyledButton(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        }, "Get Started"),
      ],
    ),
  ),
);

Widget _buildLogo(BuildContext context) => SizedBox(
  height: MediaQuery.of(context).size.height,
  width: MediaQuery.of(context).size.width,
  child: Image.asset(ImageConstant.boardingbg, fit: BoxFit.cover),
);

Widget _buildTitle(BuildContext context) => SizedBox(
  width: 253,

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
