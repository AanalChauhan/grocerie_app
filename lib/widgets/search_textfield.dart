import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';

class SearchTextfield extends StatelessWidget {
 
  SearchTextfield({super.key});
   final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xFFF2F3F2)),
      child: TextField(
      controller: SearchController(),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search,color: AppColors.textsecondary,size: 20,),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: "Search Product",
        hintStyle: Theme.of(context).textTheme.bodySmall
      ),
      ),
    );
  }
}