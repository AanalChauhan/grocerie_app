import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/widgets/gradient_container.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientContainer(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter your 4-digit code",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 35),
                      Text(
                        "Code",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.subtext,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend Code",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      SizedBox(
                        width: 67,
                        height: 67,
                        child: FloatingActionButton(
                          onPressed: () {},
                          shape: CircleBorder(),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
