import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const Center(child: Text("Category")),
    const Center(child: Text("Cart")),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// THIS SHOWS THE SCREEN
      body: screens[selectedIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 54,
        decoration: BoxDecoration(
          color: const Color(0xFF333740),
          borderRadius: BorderRadius.circular(30),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.home, 0, "Home"),
            navItem(Icons.grid_view, 1, ""),
            navItem(Icons.shopping_cart, 2, ""),
            navItem(Icons.settings, 3, "Settings"),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, int index, String label) {
    bool active = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Row(
          children: [
            Icon(icon, color: active ? Colors.black : Colors.white),

            if (label.isNotEmpty) const SizedBox(width: 6),

            if (label.isNotEmpty)
              Text(
                label,
                style: TextStyle(color: active ? Colors.black : Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
