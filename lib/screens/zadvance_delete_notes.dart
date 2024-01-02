/* This File is not in use can be used for Future purposes





*/

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class DeleteNoteScreen extends StatefulWidget {
//   const DeleteNoteScreen({Key? key}) : super(key: key);

//   @override
//   State<DeleteNoteScreen> createState() => _DeleteNoteScreenState();
// }

// class _DeleteNoteScreenState extends State<DeleteNoteScreen> {
//   List<String> selectedNoteIds = [];
//   bool selectAll = false;

//   late Stream<QuerySnapshot> _notesStream;
//   late AsyncSnapshot<QuerySnapshot>? _notesSnapshot;

//   @override
//   void initState() {
//     super.initState();
//     _notesStream = FirebaseFirestore.instance.collection("notes").snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("images/Bg.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Select Notes to Delete",
//                   style: GoogleFonts.nunito(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Handle "Select All" action
//                     setState(() {
//                       if (_notesSnapshot != null && _notesSnapshot!.hasData) {
//                         if (selectAll) {
//                           selectedNoteIds.clear();
//                         } else {
//                           selectedNoteIds = List.from(_notesSnapshot!.data!.docs
//                               .map((note) => note.id)
//                               .toList());
//                         }
//                         selectAll = !selectAll;
//                       }
//                     });
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       "Select All",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: StreamBuilder(
//                 stream: _notesStream,
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   _notesSnapshot = snapshot;
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   if (snapshot.hasData) {
//                     return ListView(
//                       children: snapshot.data!.docs
//                           .map(
//                             (note) => Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(12),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.3),
//                                       spreadRadius: 2,
//                                       blurRadius: 5,
//                                       offset: Offset(0, 3),
//                                     ),
//                                   ],
//                                 ),
//                                 child: ListTile(
//                                   contentPadding: EdgeInsets.all(16),
//                                   title: Text(
//                                     note['note_title'].toString(),
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   leading: Checkbox(
//                                     value: selectedNoteIds.contains(note.id),
//                                     onChanged: (bool? value) {
//                                       toggleSelect(note.id);
//                                     },
//                                     activeColor: Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                           .toList(),
//                     );
//                   }
//                   return Text(
//                     "No Notes",
//                     style: GoogleFonts.nunito(color: Colors.black),
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle delete operation for selected notes
//                 deleteSelectedNotes();
//                 Navigator.pop(context); // Close the delete page after deletion
//               },
//               child: Text("Delete"),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void toggleSelect(String noteId) {
//     setState(() {
//       if (selectedNoteIds.contains(noteId)) {
//         selectedNoteIds.remove(noteId);
//       } else {
//         selectedNoteIds.add(noteId);
//       }
//     });
//   }

//   void deleteSelectedNotes() {
//     for (String noteId in selectedNoteIds) {
//       print(noteId);
//       FirebaseFirestore.instance.collection("notes").doc(noteId).delete();
//     }
//   }
// }




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hnotes/style/style.dart';

// Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
//   return InkWell(
//     onTap: onTap,
//     child: Container(
//         padding: EdgeInsets.all(8),
//         margin: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: AppStyle.cardsColor[doc['color_id']],
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text(
//             doc["note_title"],
//             style: AppStyle.mainTitle,
//             overflow: TextOverflow.ellipsis,
//           ),
//           SizedBox(height: 4),
//           Text(
//             doc["creation_date"],
//             style: AppStyle.subTitle,
//           ),
//           SizedBox(height: 8),
//           Text(doc["note_content"],
//               style: AppStyle.mainContent,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis),
//         ])),
//   );
// }
