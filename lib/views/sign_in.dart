import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/widgets/%20custom_container.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomContainer(),
          Column(
            children: [
              SizedBox(
                height: 413.37,
                width: double.infinity,
                child: Image.asset(ImageConstant.signinimg, fit: BoxFit.cover),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 222,
                      child: Text(
                        "Get your groceries with nectar",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
