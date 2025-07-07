import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String userName;
  const DashboardScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data
    final int pendingCalls = 28;
    final int doneCalls = 22;
    final int scheduleCalls = 9;
    final int totalCalls = 50;
    final String listName = 'Test List';

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[700]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.red, size: 32),
                    radius: 28,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'Personal',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.play_circle_outline),
              title: const Text('Getting Started'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.sync),
              title: const Text('Sync Data'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.emoji_events),
              title: const Text('Gamification'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.send),
              title: const Text('Send Logs'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help?'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text('Cancel Subscription'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About Us'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Version 1.01.52'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share App'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.red, size: 32),
                    radius: 28,
                  ),
                  title: Text(
                    'Hello $userName',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: const Text(
                    'Welcome to Calley!',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            listName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              '$totalCalls CALLS',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 16,
                            child: Text(
                              'S',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Pie chart mock (replace with real chart if needed)
                      SizedBox(
                        height: 120,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: CircularProgressIndicator(
                                  value:
                                      (doneCalls + scheduleCalls) / totalCalls,
                                  strokeWidth: 12,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.blue,
                                  ),
                                  backgroundColor: Colors.orange,
                                ),
                              ),
                              Text(
                                '$totalCalls',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatCard(
                            'Pending',
                            pendingCalls,
                            Colors.orange,
                          ),
                          _buildStatCard('Done', doneCalls, Colors.green),
                          _buildStatCard(
                            'Schedule',
                            scheduleCalls,
                            Colors.purple,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          '$value',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
