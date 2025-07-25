import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/provider/auth_provider.dart';
import 'package:grocerie_app/views/number_screen.dart';
import 'package:grocerie_app/views/signup/signup_screen.dart';
import 'package:grocerie_app/widgets/Bottom_navbar.dart';
import 'package:provider/provider.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  String? selectedCountryName = "India";
  String? selectedCountryCode="+91";
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
  bool isLoading = false;
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
        if(isLoading)Center(child: Container( height: 50,width: 50,color: Colors.white,child: CircularProgressIndicator(),))
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
     
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height / 1.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildtitletext(context),
          SizedBox(height: 20),
          Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
            menuWidth: 65,
            value: selectedCountryName,
            underline: SizedBox(),
            icon: Icon(Icons.arrow_drop_down),
            items: countryList.map((entry) {
              final name = entry.keys.first;
              final data = entry[name]!;
              return DropdownMenuItem<String>(
                value: name,
                child: Image.asset(data["flag"]!, width: 32, height: 24),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCountryName = value;
                selectedCountryCode = _getCountryData(selectedCountryName!)["code"];
              });
            },
            selectedItemBuilder: (context) {
              return countryList.map((entry) {
                final name = entry.keys.first;
                final data = entry[name]!;
                return Row(
                  children: [Image.asset(data["flag"]!, width: 33, height: 24)],
                );
              }).toList();
            },
          ),
          SizedBox(width: 10),
          Text(
            selectedCountryCode =  _getCountryData(selectedCountryName!)["code"]!,
            // _getCountryData(selectedCountryName!)["code"]!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          SizedBox(width: 10),
          Flexible(
            child: TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    ),
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
          MaterialPageRoute(builder: (context) => SignUp()),
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

    child:ElevatedButton(
      onPressed: () async {
       setState(() {
         isLoading=true;
       });
       final authProvider = Provider.of<AuthProvider>(context, listen: false);
       final result = await authProvider.signInWithGoogle();
       setState(() {
         isLoading=false;
       });
       if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful")),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavbar()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Not able to signin with google")),
      );
    }
      
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
      onPressed: () async {
       setState(() {
         isLoading=true;
       });
       final authProvider = Provider.of<AuthProvider>(context, listen: false);
       final result = await authProvider.signInWithFacebook();
       setState(() {
         isLoading=false;
       });
      if(result=="success"){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful")),
      ); 
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavbar()));
      }else{
           ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Not able to signin with facebook")),
      );}
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
