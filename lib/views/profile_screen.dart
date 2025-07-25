import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/constants/image_constant.dart';
import 'package:grocerie_app/provider/auth_provider.dart';
import 'package:grocerie_app/views/preview_screen.dart';
import 'package:grocerie_app/widgets/styled_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(25),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        ImageConstant.profileimg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "UserName",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.edit_outlined, color: AppColors.primary),
                        ],
                      ),
                      Text(
                        "Email-id",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 10, color: Color(0xFFE2E2E2)),
            ListTile(
              leading: Icon(Icons.badge_outlined),
              title: Text("My Details"),
              trailing: Icon(Icons.arrow_forward_ios, size: 20),
            ),
            Divider(height: 10, color: Color(0xFFE2E2E2)),
            Spacer(),
            InkWell(
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => PreviewScreen()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(20),
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(Icons.logout, color: AppColors.primary),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Logout",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppColors.primary,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
