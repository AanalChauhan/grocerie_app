import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/widgets/dropdown_textfield.dart';
import 'package:grocerie_app/widgets/floating_button.dart';
import 'package:grocerie_app/widgets/gradient_container.dart';
import 'package:provider/provider.dart';
import 'package:grocerie_app/provider/auth_provider.dart' as authProvider;

class NumberScreen extends StatefulWidget {

  NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  String selectedCountryName = "India";
  String selectedCountryCode="+91";
  final List<Map<String, Map<String, String>>> countryList = [
    {
      "India": {"code": "+91", "flag": ImageConstant.indiaimg},
    },
    {
      "United Kingdom": {"code": "+44", "flag": ImageConstant.ukimg},
    },
    {
      "United States": {"code": "+1", "flag": ImageConstant.usimg},
    },
    {
      "Germany": {"code": "+49", "flag": ImageConstant.germanyimg},
    },
  ];

  Map<String, String> _getCountryData(String countryName) {
    for (var country in countryList) {
      if (country.containsKey(countryName)) {
        return country[countryName]!;
      }
    }
    return {"code": "+91", "flag": ImageConstant.indiaimg};
  }
  final TextEditingController numberController = TextEditingController();


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
           DropdownTextfield(controller: numberController, update: (String? value) {
              setState(() {
                selectedCountryName = value!;
                selectedCountryCode = _getCountryData(selectedCountryName)["code"]!;
              });
             }, selectedCountryName: selectedCountryName, selectedCountryCode: selectedCountryCode,)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 25.0, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // FloatingButton(() async {
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(builder: (context) => VerificationScreen()),
            //   // );
            //   // await FirebaseAuth.instance.verifyPhoneNumber(
            //   //   verificationCompleted: (PhoneAuthCredential credential) {},
            //   //   verificationFailed: (FirebaseAuthException e) {},
            //   //   codeSent: (String verificationid, int? resendtoken) {Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationScreen(verificationid: verificationid,)));},
            //   //   codeAutoRetrievalTimeout: (String verificationid) {},
            //   //   phoneNumber: numberController.text.toString(),
            //   // );

            // }),
            FloatingButton(()async{
              final phone = numberController.text.toString();
              final phoneNumber = selectedCountryCode+phone;
              if(phoneNumber.isNotEmpty){
                Provider.of<authProvider.AuthProvider>(context, listen: false).signInUsingPhone(phoneNumber: phoneNumber, context: context);
              }
              else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter a valid number")),
                  );
                }
            })
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
