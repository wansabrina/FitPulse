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

    switch (index) {
      case 0:
        _fadeToScreen(context, HomeScreen());
        break;
      case 1:
        _fadeToScreen(context, const ActivitiesScreen());
        break;
      case 2:
        _fadeToScreen(context, const NutritionsScreen());
        break;
      case 3:
        _fadeToScreen(context, const ProfileScreen());
        break;
    }
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
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Icon(Icons.home),
          ),
          activeIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Icon(Icons.home),
              ),
              SizedBox(height: 5),
              Text(
                'Home',
                style: TextStyle(fontSize: 10, color: blue500),
              ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Icon(Icons.bar_chart),
          ),
          activeIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Icon(Icons.bar_chart),
              ),
              SizedBox(height: 5),
              Text(
                'Activities',
                style: TextStyle(fontSize: 10, color: blue500),
              ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Icon(Icons.fastfood),
          ),
          activeIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Icon(Icons.fastfood),
              ),
              SizedBox(height: 5),
              Text(
                'Meals',
                style: TextStyle(fontSize: 10, color: blue500),
              ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Icon(Icons.person),
          ),
          activeIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Icon(Icons.person),
              ),
              SizedBox(height: 5),
              Text(
                'Profile',
                style: TextStyle(fontSize: 10, color: blue500),
              ),
            ],
          ),
          label: '',
        ),
      ],
    );
  }
}
