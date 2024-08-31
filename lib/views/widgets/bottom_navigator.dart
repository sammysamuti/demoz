import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTabChange,
      items: [
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Container(
                height: 8,
                width: 50,
                decoration: BoxDecoration(
                  color: selectedIndex == 0 ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Image.asset(
                'assets/images/home.png',
                color: selectedIndex == 0 ? Colors.blue : Colors.black,
                height: 50,
                width: 50,
              ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Container(
                height: 8,
                width: 50,
                decoration: BoxDecoration(
                  color: selectedIndex == 1 ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Image.asset(
                'assets/images/folder.png',
                color: selectedIndex == 1 ? Colors.blue : Colors.black,
                height: 50,
                width: 50,
              ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Container(
                height: 8,
                width: 50,
                decoration: BoxDecoration(
                  color: selectedIndex == 2 ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Image.asset(
                'assets/images/profile.png',
                color: selectedIndex == 2 ? Colors.blue : Colors.black,
                height: 50,
                width: 50,
              ),
            ],
          ),
          label: '',
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
    );
  }
}
