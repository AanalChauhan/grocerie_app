import 'package:flutter/material.dart';
import 'package:grocerie_app/provider/auth_provider.dart';
import 'package:grocerie_app/views/preview_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: ElevatedButton(onPressed: (){
                 Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => PreviewScreen()),
                );
              }, child: Text("logout")),
      )
    );
  }
}