import 'package:bharti_creation_app/screens/home_page.dart';
import 'package:bharti_creation_app/widgets/app_bar.dart';
import 'package:bharti_creation_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  int _screenIndex = 0;

  static const List<Widget> pages = [
    HomePage(),
    Text("Product"),
    Text("Profile"),
  ];

  void _handleTap(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppBar(),
      body: Center(child: pages[_screenIndex]),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _screenIndex,
        onTap: _handleTap,
      ),
    );
  }
}
