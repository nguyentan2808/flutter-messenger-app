// // ignore_for_file: unnecessary_const

// import 'package:flutter/material.dart';
// import '../../../components/filled_outline_button.dart';
// import '../../chat_detail/chat_detail_screen.dart';

// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);

//   void handleOpenChatDetail(BuildContext context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => ChatDetailScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(8),
//           color: Theme.of(context).primaryColor,
//           child: Row(children: [
//             FillOutlineButton(press: () {}, text: "Recent Message"),
//             const SizedBox(width: 8),
//             FillOutlineButton(
//               press: () {},
//               text: "Active",
//               isFilled: false,
//             )
//           ]),
//         ),
//         Container(child: Te,)
//         Expanded(
//             child: ListView.builder(
//                 itemCount: 20,
//                 itemBuilder: (context, index) => ChatItem(
//                       onPress: () => handleOpenChatDetail(context),
//                       index: index,
//                     ),))
//       ],
//     );
//   }
// }

// class ChatItem extends StatelessWidget {
//   const ChatItem({Key? key, required this.onPress, required this.index})
//       : super(key: key);
//   final int index;
//   final VoidCallback onPress;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPress,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           children: [
//             Stack(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage(index % 2 == 0
//                       ? 'assets/images/avatar.jpg'
//                       : 'assets/images/avatar2.jpg'),
//                 ),
//                 if (index % 2 == 0)
//                   Positioned(
//                       right: 0,
//                       bottom: 0,
//                       child: Container(
//                         height: 14,
//                         width: 14,
//                         decoration: BoxDecoration(
//                             color: Colors.green,
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                                 color:
//                                     Theme.of(context).scaffoldBackgroundColor,
//                                 width: 2),),
//                       ),)
//               ],
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Jenny Wilson',
//                       style: TextStyle(fontWeight: FontWeight.w500),
//                     ),
//                     SizedBox(height: 2),
//                     Text(
//                       'Hope you are doing well',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(fontSize: 13),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             const Opacity(
//               opacity: 0.8,
//               child: Text(
//                 "3m ago",
//                 style: TextStyle(
//                   fontSize: 13,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
