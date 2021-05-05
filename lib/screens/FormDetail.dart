// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:halyk_fund/util/constants.dart';
//
// class DetailPage extends StatefulWidget {
//   @override
//   _DetailPageState createState() => _DetailPageState();
// }
//
// class _DetailPageState extends State<DetailPage> {
//   final double expanded_height = 290;
//   final double rounded_container_height = 100;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           CustomScrollView(
//             slivers: <Widget>[
//               _buildSliverHead(),
//               SliverToBoxAdapter(
//                 child: _buildDetail(),
//               )
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: MediaQuery.of(context).padding.top,
//             ),
//             child: SizedBox(
//               height: kToolbarHeight,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 15,
//                       ),
//                       child: Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(20))
//
//                     ),
//                     padding: EdgeInsets.all(5),
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 15,
//                     ),
//                     child: Icon(
//                       Icons.notifications_none,
//                       color: Colors.black87,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSliverHead() {
//     return SliverPersistentHeader(
//       delegate: DetailSliverDelegate(
//         expanded_height,
//         rounded_container_height,
//       ),
//     );
//   }
//
//   Widget _buildDetail() {
//     return Container(
//       color: Colors.red,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           _buildUserInfo(),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: 15,
//               horizontal: 15,
//             ),
//             child: Text(
//               "The balearic Lsnaled,The Lsnaled,The balea balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,The balearic Lsnaled,The balea Lsnaled,"
//               "The balearic Lsnaled,The balearic Lsnaled,",
//               style: TextStyle(
//                 color: Colors.black38,
//                 height: 1.4,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: 15,
//               horizontal: 15,
//             ),
//             child: Text(
//               "The balearic Lsnaled,The Lsnaled,The balea balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,The balearic Lsnaled,The balea Lsnaled,"
//               "The balearic Lsnaled,The balearic Lsnaled,",
//               style: TextStyle(
//                 color: Colors.black38,
//                 height: 1.4,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: 15,
//               horizontal: 15,
//             ),
//             child: Text(
//               "The balearic Lsnaled,The Lsnaled,The balea balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,The balearic Lsnaled,The balea Lsnaled,"
//               "The balearic Lsnaled,The balearic Lsnaled,",
//               style: TextStyle(
//                 color: Colors.black38,
//                 height: 1.4,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: 15,
//               horizontal: 15,
//             ),
//             child: Text(
//               "The balearic Lsnaled,The Lsnaled,The balea balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
//               "The balearic Lsnaled,The balearic Lsnaled,The balea Lsnaled,"
//               "The balearic Lsnaled,The balearic Lsnaled,",
//               style: TextStyle(
//                 color: Colors.black38,
//                 height: 1.4,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildUserInfo() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       child: Row(
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: BorderRadius.circular(50),
//             child: Image.network(
//               "https://i.imgur.com/166zlg4.jpg",
//               width: 50,
//               height: 50,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 10,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   "widget.bean.name",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "Writer,Wonderlust",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           Icon(
//             Icons.share,
//             color: Colors.black54,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
