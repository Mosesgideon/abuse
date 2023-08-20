//
// import 'package:abuse/features/dashboard/screens/reports.dart';
// import 'package:abuse/features/dashboard/screens/settings.dart';
// import 'package:flutter/material.dart';
//
// import 'dashboard.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   static List<StatefulWidget> pages = [
//     const DashBoard(),
//     const Reports(),
//     const Settings()
//   ];
//
//   _switchTap(int index) {
//     setState(() {
//       selectindex = index;
//     });
//   }
//
//   int selectindex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.grey,
//         unselectedItemColor: Colors.black,
//         onTap: (index) {
//           _switchTap(index);
//         },
//         currentIndex: selectindex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.report_outlined), label: 'Reports'),
//
//           // BottomNavigationBarItem(
//           //     icon: Icon(Icons.notifications_none_outlined),
//           //     label: 'Notifications'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//       ),
//
//       body: IndexedStack(index: selectindex, children: pages),
//     );
//   }
// }
