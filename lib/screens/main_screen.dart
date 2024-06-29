import 'package:bharti_creation_app/screens/home_page.dart';
import 'package:bharti_creation_app/screens/product_page.dart';
import 'package:bharti_creation_app/utils/product_types.dart';
import 'package:bharti_creation_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  // int _screenIndex = 0;

  // static const List<Widget> pages = [
  //   HomePage(),
  // ProductPage(productType: ProductTypes.nameplates),
  // ProductPage(productType: ProductTypes.ledNameplates),
  // ProductPage(productType: ProductTypes.dndPanels),
  // ProductPage(productType: ProductTypes.societyNameBoards),
  // Text("About"),
  // ];

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return const Scaffold(
      appBar: CustomAppBar(title: "Bharti Creation"),
      body: Center(child: HomePage()),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: theme.colorScheme.primary,
      //         ),
      //         child: const Text(
      //           'Welcome, My Fren',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 26,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Home'),
      //         selected: _screenIndex == 0,
      //         onTap: () {
      //           setState(() => _screenIndex = 0);
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Nameplates'),
      //         selected: _screenIndex == 1,
      //         onTap: () {
      //           setState(() => _screenIndex = 1);
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('LED Nameplates'),
      //         selected: _screenIndex == 2,
      //         onTap: () {
      //           setState(() => _screenIndex = 2);
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('DND Panels'),
      //         selected: _screenIndex == 3,
      //         onTap: () {
      //           setState(() => _screenIndex = 3);
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Society Name Boards'),
      //         selected: _screenIndex == 4,
      //         onTap: () {
      //           setState(() => _screenIndex = 4);
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('About'),
      //         selected: _screenIndex == 5,
      //         onTap: () {
      //           setState(() => _screenIndex = 5);
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
