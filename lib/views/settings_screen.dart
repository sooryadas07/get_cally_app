// import 'package:flutter/material.dart';
// import '../controllers/settings_controller.dart';
// import '../models/user_model.dart';
// import 'dashboard_screen.dart';
//
// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }
//
// class _SettingsScreenState extends State<SettingsScreen> {
//   final SettingsController _controller = SettingsController();
//
//   void _showCallingListModal() {
//     final lists = _controller.getCallingLists();
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Center(
//                 child: Text(
//                   'CALLING LISTS',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ...lists.map(
//                 (list) => ListTile(
//                   title: Text(list),
//                   trailing:
//                       list == 'Select Calling List'
//                           ? ElevatedButton.icon(
//                             onPressed: () {},
//                             icon: const Icon(Icons.refresh),
//                             label: const Text('Refresh'),
//                           )
//                           : const Icon(Icons.chevron_right),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final user = _controller.getUser();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: const Text('Setting', style: TextStyle(color: Colors.black)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       backgroundColor: const Color(0xFFF7F7F7),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           // Profile Card
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             padding: const EdgeInsets.all(16),
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
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Hello ${user.name}',
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
//                         user.phone,
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       Text(
//                         'Current Subscription: ${user.subscription ?? ''}',
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           // Profile Settings
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   decoration: const BoxDecoration(
//                     color: Color(0xFF1A3353),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(16),
//                       topRight: Radius.circular(16),
//                     ),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'PROFILE SETTINGS',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.language),
//                   title: const Text('App Language'),
//                   trailing: const Icon(Icons.chevron_right),
//                   onTap: () {},
//                 ),
//                 const Divider(height: 0),
//                 ListTile(
//                   leading: const Icon(Icons.lock_outline),
//                   title: const Text('Change Password'),
//                   trailing: const Icon(Icons.chevron_right),
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           // Calling List Modal Button
//           GestureDetector(
//             onTap: _showCallingListModal,
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 18),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//               ),
//               child: const Center(
//                 child: Text(
//                   'Show Calling Lists',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
