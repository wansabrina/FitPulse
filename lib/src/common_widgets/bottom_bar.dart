import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/activities/activities_screen.dart';
import 'package:fitpulse/src/features/home_screen.dart';
import 'package:fitpulse/src/features/nutritions/nutritions_screen.dart';
import 'package:fitpulse/src/features/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    final screens = [
      HomeScreen(),
      const ActivitiesScreen(),
      const NutritionsScreen(),
      const ProfileScreen(),
    ];

    _fadeToScreen(context, screens[index]);
  }

  void _fadeToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
    ));
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, bool isActive) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: isActive ? 5.0 : 12.0),
        child: Icon(icon),
      ),
      activeIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Icon(icon),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: blue500),
          ),
        ],
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: blue500,
      unselectedItemColor: Colors.black,
      iconSize: 24,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      onTap: _onItemTapped,
      items: [
        _buildNavItem(Icons.home, 'Home', _selectedIndex == 0),
        _buildNavItem(Icons.bar_chart, 'Activities', _selectedIndex == 1),
        _buildNavItem(Icons.fastfood, 'Meals', _selectedIndex == 2),
        _buildNavItem(Icons.person, 'Profile', _selectedIndex == 3),
      ],
    );
  }
}
