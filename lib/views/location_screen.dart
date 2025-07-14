import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/views/location_input.dart';
import 'package:grocerie_app/widgets/gradient_container.dart';
import 'package:grocerie_app/widgets/styled_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // String? selectedZone = "abc";
  // String? selectedArea;
  // final List<String> zones = ["abc", "def", "ghi", "jkl"];
  // final List<String> areas = [" A", " B", " C"];
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Image.asset(ImageConstant.mapimg, width: 200),
                      SizedBox(height: 30),
                      Text(
                        "Select Your Location",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Switch on your location to stay in tune with\nwhat’s happening in your area",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(letterSpacing: 0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                LocationInput(),
                // Container(
                //   margin: EdgeInsets.all(35),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       SizedBox(height: 24),
                //       Text(
                //         "Your Zone",
                //         style: Theme.of(context).textTheme.bodySmall,
                //       ),

                //       DropdownButtonFormField<String>(
                //         value: selectedZone,
                //         icon: Icon(
                //           Icons.keyboard_arrow_down,
                //           color: AppColors.smalltext,
                //           size: 30,
                //         ),
                //         hint: Text(
                //           "Select your zone",
                //           style: Theme.of(context).textTheme.bodyLarge,
                //         ),
                //         items: zones.map((zone) {
                //           return DropdownMenuItem(
                //             value: zone,
                //             child: Text(
                //               zone,
                //               style: Theme.of(context).textTheme.bodyLarge
                //                   ?.copyWith(color: AppColors.textsecondary),
                //             ),
                //           );
                //         }).toList(),
                //         onChanged: (value) {
                //           setState(() => selectedZone = value);
                //         },
                //         decoration: const InputDecoration(
                //           enabledBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: AppColors.smalltext),
                //           ),
                //           focusedBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: AppColors.smalltext),
                //           ),
                //         ),
                //       ),

                //       SizedBox(height: 32),
                //       Text(
                //         "Your Area",
                //         style: Theme.of(context).textTheme.bodySmall,
                //       ),

                //       DropdownButtonFormField<String>(
                //         value: selectedArea,
                //         icon: Icon(
                //           Icons.keyboard_arrow_down,
                //           color: AppColors.smalltext,
                //           size: 30,
                //         ),
                //         hint: Text(
                //           "Type your area",
                //           style: Theme.of(context).textTheme.bodyLarge,
                //         ),
                //         items: areas.map((area) {
                //           return DropdownMenuItem(
                //             value: area,
                //             child: Text(
                //               area,
                //               style: Theme.of(context).textTheme.bodyLarge
                //                   ?.copyWith(color: AppColors.textsecondary),
                //             ),
                //           );
                //         }).toList(),
                //         onChanged: (value) {
                //           setState(() => selectedArea = value);
                //         },
                //         decoration: const InputDecoration(
                //           enabledBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: AppColors.smalltext),
                //           ),
                //           focusedBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: AppColors.smalltext),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.all(35),
                  child: StyledButton(() {}, "Submit"),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
