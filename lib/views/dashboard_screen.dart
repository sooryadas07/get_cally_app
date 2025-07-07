// import 'package:flutter/material.dart';
// import '../controllers/dashboard_controller.dart';
// import '../models/user_model.dart';
// // import '../models/call_stats_model.dart';
// import 'settings_screen.dart';
// import 'drawer_widget.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   final DashboardController _controller = DashboardController();
//   int _selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final user = _controller.getUser();
//     final stats = _controller.getCallStats();
//
//     return Scaffold(
//       drawer: DrawerWidget(user: user),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: const Text('Dashboard', style: TextStyle(color: Colors.black)),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.headset_mic_outlined),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const SettingsScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       backgroundColor: const Color(0xFFF7F7F7),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           // Welcome Card
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
//                 const Expanded(
//                   child: Text(
//                     'Hello Swati\nWelcome to Calley!',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           // Load Number Card
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
//                       'LOAD NUMBER TO CALL',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       const Text(
//                         'Visit https://app.getcalley.com to upload numbers that you wish to call using Calley Mobile App.',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 15),
//                       ),
//                       const SizedBox(height: 12),
//                       SizedBox(
//                         height: 120,
//                         child: Center(
//                           child: Icon(
//                             Icons.download_rounded,
//                             size: 80,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             icon: const Icon(
//                               Icons.call,
//                               color: Colors.green,
//                               size: 32,
//                             ),
//                             onPressed: () {},
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 8.0,
//                               ),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Star Calling Now',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           // Stats Card
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//             ),
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '${stats.listName}\n${stats.total} CALLS',
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     CircleAvatar(child: Text('S')),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 SizedBox(
//                   height: 120,
//                   child: Center(
//                     child: Icon(Icons.pie_chart, size: 80, color: Colors.blue),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _statBox('Pending', stats.pending, Colors.orange),
//                     _statBox('Done', stats.done, Colors.green),
//                     _statBox('Schedule', stats.scheduled, Colors.purple),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       'Star Calling Now',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//           if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => const SettingsScreen()),
//             );
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.play_circle_fill),
//             label: '',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.phone), label: ''),
//         ],
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
//
//   Widget _statBox(String label, int value, Color color) {
//     return Column(
//       children: [
//         Text(
//           '$value',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: color,
//             fontSize: 18,
//           ),
//         ),
//         Text(label, style: const TextStyle(fontSize: 13)),
//         const Text(
//           'Calls',
//           style: TextStyle(fontSize: 11, color: Colors.black54),
//         ),
//       ],
//     );
//   }
// }
