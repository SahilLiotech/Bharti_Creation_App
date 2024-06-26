import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  const CustomeAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Bharti Creation"),
      centerTitle: true,
      backgroundColor: const Color(0xFF057ca1),
      foregroundColor: Colors.white,
      actions: [
        PopupMenuButton(
          onSelected: _handleClick,
          itemBuilder: (ctx) => [
            const PopupMenuItem(
              value: 0,
              child: Text("Logout"),
            ),
            const PopupMenuItem(
              value: 1,
              child: Text("About"),
            ),
          ],
        ),
      ],
    );
  }

  void _handleClick(int opt) {
    switch (opt) {
      case 0:
        print('logging out');
        break;
      case 1:
        print('About Us');
        break;
      default:
        throw UnimplementedError();
    }
  }
}
