// import 'package:flutter/material.dart';
// import '../models/user_model.dart';
//
// class DrawerWidget extends StatelessWidget {
//   final UserModel user;
//   const DrawerWidget({Key? key, required this.user}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: const BoxDecoration(color: Colors.blue),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 28,
//                   backgroundColor: Colors.yellow,
//                   child: Icon(Icons.person, size: 36, color: Colors.blue[900]),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         user.name,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         user.email,
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       Text(
//                         user.subscription ?? '',
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           _drawerItem(Icons.flag, 'Getting Started'),
//           _drawerItem(Icons.sync, 'Sync Data'),
//           _drawerItem(Icons.emoji_events, 'Gamification'),
//           _drawerItem(Icons.send, 'Send Logs'),
//           _drawerItem(Icons.settings, 'Settings'),
//           _drawerItem(Icons.help_outline, 'Help?'),
//           _drawerItem(Icons.cancel, 'Cancel Subscription'),
//           const Divider(),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text(
//               'App Info',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           _drawerItem(Icons.info_outline, 'About Us'),
//           _drawerItem(Icons.privacy_tip, 'Privacy Policy'),
//           _drawerItem(Icons.verified, 'Version 1.01.52'),
//           _drawerItem(Icons.share, 'Share App'),
//           _drawerItem(Icons.logout, 'Logout'),
//         ],
//       ),
//     );
//   }
//
//   Widget _drawerItem(IconData icon, String title) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.blue),
//       title: Text(title),
//       onTap: () {},
//     );
//   }
// }
