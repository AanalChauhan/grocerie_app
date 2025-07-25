import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/image_constant.dart';

class DropdownTextfield extends StatefulWidget {
  const DropdownTextfield({super.key,required this.controller,required this.update,});
  final TextEditingController controller;
  final void Function(String?,String?)update;

  @override
  State<DropdownTextfield> createState() => _DropdownTextfieldState();
}

class _DropdownTextfieldState extends State<DropdownTextfield> {
  String? selectedCountryName = "India";
  String? selectedCountryCode="+91";
  @override
  Widget build(BuildContext context) {
  
     
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

    return Container(
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
              var country = countryList.firstWhere((s) => s.keys.contains(value));
              String? code = country[value]!['code'];
              setState(() {
                 selectedCountryName = value;
                 selectedCountryCode = code;
              });
              print(country);
              widget.update.call(value,code);
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
            selectedCountryCode!,
            // _getCountryData(selectedCountryName!)["code"]!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          SizedBox(width: 10),
          Flexible(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
