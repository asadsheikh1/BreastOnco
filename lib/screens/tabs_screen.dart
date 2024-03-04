import 'package:breast_onco/screens/account_screen.dart';
import 'package:breast_onco/screens/courses_screen.dart';
import 'package:breast_onco/screens/home_screen.dart';
import 'package:breast_onco/screens/goals_screen.dart';
import 'package:breast_onco/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const routeName = '/tabs';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pages = [
      {
        'page': const HomeScreen(),
        'title': 'Dash',
        'icon': Icons.rocket,
      },
      {
        'page': const GoalsScreen(),
        'title': 'Patients',
        'icon': Icons.people,
      },
      {
        'page': const CoursesScreen(),
        'title': 'Add New',
        'icon': Icons.add,
      },
      {
        'page': const AccountScreen(),
        'title': 'Account',
        'icon': Icons.person,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo-purple.png',
          height: 100,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: kLightColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: kDarkColor.withOpacity(0.1),
            ),
          ],
        ),
        child: GNav(
          selectedIndex: _selectedPageIndex,
          onTabChange: _selectPage,
          rippleColor: kSecondarySwatchColor.shade50,
          gap: 8,
          color: kSecondarySwatchColor,
          activeColor: kSecondarySwatchColor.shade50,
          tabBackgroundColor: kSecondarySwatchColor,
          backgroundColor: kLightColor,
          padding: const EdgeInsets.all(16.0),
          tabs: [
            GButton(
              icon: pages[0]['icon'],
              text: pages[_selectedPageIndex]['title'],
            ),
            GButton(
              icon: pages[1]['icon'],
              text: pages[_selectedPageIndex]['title'],
            ),
            GButton(
              icon: pages[2]['icon'],
              text: pages[_selectedPageIndex]['title'],
            ),
            GButton(
              icon: pages[3]['icon'],
              text: pages[_selectedPageIndex]['title'],
            ),
          ],
        ),
      ),
    );
  }
}
