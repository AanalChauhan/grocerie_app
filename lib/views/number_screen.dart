import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/views/verification_screen.dart';
import 'package:grocerie_app/widgets/dropdown_textfield.dart';
import 'package:grocerie_app/widgets/floating_button.dart';
import 'package:grocerie_app/widgets/gradient_container.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientContainer(),
        SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: _buildappbar,
              body: _buildbodycontent(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildbodycontent(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your mobile number",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 35),
            Text(
              "Mobile Number",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.subtext,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            DropdownTextfield(),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 25.0, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingButton(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerificationScreen()),
              );
            }),
          ],
        ),
      ),
    ],
  );

  PreferredSizeWidget? get _buildappbar => AppBar(
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: true,
  );
}
