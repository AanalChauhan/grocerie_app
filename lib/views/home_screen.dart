import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/widgets/search_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Image.asset(ImageConstant.carrotimg,width: 28),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.location_on_rounded,color: const Color.fromARGB(250, 76, 79, 77),),Text("Dhaka, Banassre",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600,color: const Color.fromARGB(250, 76, 79, 77)),)],),
              SizedBox(height: 10,),
              SearchTextfield(),
            
          ],
        ),
      ),
    ),
    );
  }
}