import 'package:demoz/views/pages/payroll_manage_page.dart';
import 'package:demoz/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:demoz/views/widgets/bottom_navigator.dart';
import 'package:demoz/views/pages/home_page.dart';

class MainScreen extends StatefulWidget {
  static String route = 'mainscreen-page';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    HomePage(),
     ManagementPage(),
     ProfilePage(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _currentIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
