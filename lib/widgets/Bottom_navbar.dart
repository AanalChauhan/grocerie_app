import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';
import 'package:grocerie_app/views/home_screen.dart';
import 'package:grocerie_app/views/login/login_screen.dart';

class BottomNavbar extends StatefulWidget {
  //  final int currentIndex;
  // final Function(int) onTap;
  const BottomNavbar({super.key,});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    LoginScreen(),
    Center(child: Text("Cart")),
    Center(child: Text("Favourite")),
    Center(child: Text("Account")),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       body: IndexedStack(
//   index: _selectedIndex,
//   children: _pages,
// ),
body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
      ),
    ],
  ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar( currentIndex: _selectedIndex,
            onTap:_onTabTapped,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textsecondary,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            iconSize: 26,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Shop'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: 'Favourite'),
              BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Account'),
            ],),
        ),
      ),
    );
  }
}