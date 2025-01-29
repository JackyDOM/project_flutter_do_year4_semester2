import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/cafe_screen.dart';
import 'package:project1/screens/food_screen.dart';
import 'package:project1/screens/sea_screen.dart';
import 'package:project1/screens/temple_screen.dart';

class bottomNavScreen extends StatefulWidget {
  const bottomNavScreen({super.key});

  @override
  State<bottomNavScreen> createState() => _bottomNavScreenState();
}

class _bottomNavScreenState extends State<bottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    food_screen(),
    sea_screen(),
    temple_screen(),
    cafe_screen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Food'),
          BottomNavigationBarItem(icon: Icon(Icons.pool), label: 'Sea'),
          BottomNavigationBarItem(icon: Icon(Icons.temple_hindu), label: 'Temple'),
          BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: 'Cafe'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
