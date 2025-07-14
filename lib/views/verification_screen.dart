import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/views/location_screen.dart';
import 'package:grocerie_app/widgets/floating_button.dart';
import 'package:grocerie_app/widgets/gradient_container.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});
  final TextEditingController passwordController = TextEditingController();

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

  Widget _buildtextbutton(BuildContext context) => TextButton(
    onPressed: () {},
    child: Text(
      "Resend Code",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _buildbottomcontent(BuildContext context) => Padding(
    padding: const EdgeInsets.all(25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildtextbutton(context),
        FloatingButton(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationScreen()),
          );
        }),
      ],
    ),
  );

  Widget _buildtextfield(BuildContext context) => Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey)),
    ),
    child: TextField(
      controller: passwordController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: "- - - -",
      ),
    ),
  );

  Widget _buildbodycontent(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildtitletext(context),
            SizedBox(height: 35),
            _buildbodytext(context),
            SizedBox(height: 10),
            _buildtextfield(context),
          ],
        ),
      ),
      _buildbottomcontent(context),
    ],
  );

  PreferredSizeWidget? get _buildappbar => AppBar(
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: true,
  );

  Widget _buildtitletext(BuildContext context) => Text(
    "Enter your 4-digit code",
    style: Theme.of(context).textTheme.titleLarge,
  );

  Widget _buildbodytext(BuildContext context) => Text(
    "Code",
    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: AppColors.subtext,
      fontWeight: FontWeight.w600,
    ),
  );
}
