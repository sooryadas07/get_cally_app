import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'dashboard_screen.dart';

class MainNavScreen extends StatefulWidget {
  final String userName;
  const MainNavScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(userName: widget.userName),
      DashboardScreen(userName: widget.userName),
      SettingsScreen(userName: widget.userName),
      CallsScreen(userName: widget.userName),
      HelpScreen(userName: widget.userName),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemCount: 5,
        icons: [
          Icons.home,
          Icons.dashboard,
          Icons.settings,
          Icons.phone,
          Icons.help_outline,
        ],
      ),
    );
  }
}

class CallsScreen extends StatelessWidget {
  final String userName;
  const CallsScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calls')),
      body: Center(child: Text('Calls for $userName')),
    );
  }
}

class HelpScreen extends StatelessWidget {
  final String userName;
  const HelpScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help')),
      body: Center(child: Text('Help for $userName')),
    );
  }
}
