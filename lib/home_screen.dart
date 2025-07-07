import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://mock-api.calleyacd.com/api/',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  bool isLoading = true;
  List<dynamic> userLists = [];
  String userId = '68626f9497757cb741f449b0';
  String email = 'dhrubo@yopmail.com';

  @override
  void initState() {
    super.initState();
    fetchUserLists();
  }

  Future<void> fetchUserLists() async {
    try {
      final response = await _dio.get(
        'list',
        queryParameters: {'userId': userId, 'email': email},
      );
      if (response.statusCode == 200) {
        setState(() {
          userLists = response.data is List ? response.data : [response.data];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load list");
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello ${widget.userName}')),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    color: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'LOAD NUMBER TO CALL',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            ' using Calley Mobile App.',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://plus.unsplash.com/premium_photo-1661299251279-117a49a32548?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (userLists.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Your Lists:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ...userLists.map(
                                  (list) => ListTile(
                                    title: Text(
                                      list['name'] ?? 'No Name',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'List ID: ${list['_id']}',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          else
                            const Text(
                              'No lists found',
                              style: TextStyle(color: Colors.white),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
    );
  }
}

// Dummy SettingsScreen for navigation
class SettingsScreen extends StatelessWidget {
  final String userName;
  const SettingsScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(child: Text('Settings for $userName')),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int itemCount;
  final List<IconData> icons;
  const CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.icons,
    this.itemCount = 4,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            itemCount,
            (index) => _buildNavItem(icons[index], index, currentIndex, onTap),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    int index,
    int currentIndex,
    ValueChanged<int> onTap,
  ) {
    final bool isSelected = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: 48,
        height: 48,
        decoration:
            isSelected
                ? BoxDecoration(color: Colors.white, shape: BoxShape.circle)
                : null,
        child: Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
