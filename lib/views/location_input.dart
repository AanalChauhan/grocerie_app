import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  var _isGettingLocation = false;

  String? selectedZone = "abc";
  String? selectedArea;
  final List<String> zones = ["abc", "def", "ghi", "jkl"];
  final List<String> areas = [" A", " B", " C"];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    Widget PreviewContent = SizedBox(
      child: Center(child: Text("No Location Chosen")),
    );

    if (_isGettingLocation) {
      PreviewContent = CircularProgressIndicator();
    }

    return Container(
      margin: EdgeInsets.all(35),
      child: isLoading
          ? PreviewContent
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 24),
                Text("Your Zone", style: Theme.of(context).textTheme.bodySmall),

                DropdownButtonFormField<String>(
                  value: selectedZone,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.smalltext,
                    size: 30,
                  ),
                  hint: Text(
                    "Select your zone",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppColors.subtext),
                  ),
                  items: zones.map((zone) {
                    return DropdownMenuItem(
                      value: zone,
                      child: Text(
                        zone,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textsecondary,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => selectedZone = value);
                  },
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.smalltext),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.smalltext),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Text("Your Area", style: Theme.of(context).textTheme.bodySmall),

                DropdownButtonFormField<String>(
                  value: selectedArea,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.smalltext,
                    size: 30,
                  ),
                  hint: Text(
                    "Type your area",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppColors.subtext),
                  ),
                  items: areas.map((area) {
                    return DropdownMenuItem(
                      value: area,
                      child: Text(
                        area,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textsecondary,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => selectedArea = value);
                  },
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.smalltext),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.smalltext),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void _getCurrentLocation() async {
    Location location = Location();
    Location? _pickedLocation;

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    setState(() {
      _isGettingLocation = false;
    });
    print(locationData.latitude);
    print(locationData.longitude);
  }
}
