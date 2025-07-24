import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/provider/auth_provider.dart' as authProvider;
import 'package:grocerie_app/widgets/floating_button.dart';
import 'package:grocerie_app/widgets/gradient_container.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatelessWidget {
  String verificationid;
  VerificationScreen({super.key, required this.verificationid});

  final TextEditingController otpController = TextEditingController();

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
    onPressed: () {
    },
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
        FloatingButton(() async {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => LocationScreen()),
          // );
          // try{
          // PhoneAuthCredential credential= await PhoneAuthProvider.credential(verificationId: widget.verificationid, smsCode: otpController.text.toString());
          // FirebaseAuth.instance.signInWithCredential(credential).then((value){Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavbar()));});
          // }catch(e){return e.toString();}
          final otp = otpController.text.trim();
         if (otp.isNotEmpty) {
                 await Provider.of<authProvider.AuthProvider>(context, listen: false)
                      .verifyUser(
                    context: context, smsCode: otp, verificationid: verificationid,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter a valid number")),
                  );
                }
        }),
      ],
    ),
  );

  Widget _buildtextfield(BuildContext context) => Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey)),
    ),
    child: TextField(
      controller: otpController,
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
