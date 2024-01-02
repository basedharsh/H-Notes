import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hnotes/style/style.dart';

class ReadNoteScreen extends StatefulWidget {
  ReadNoteScreen(this.doc, {super.key});
  QueryDocumentSnapshot doc;

  @override
  State<ReadNoteScreen> createState() => _ReadNoteScreenState();
}

class _ReadNoteScreenState extends State<ReadNoteScreen> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.doc["note_title"],
            style: AppStyle.mainTitle,
          ),
          SizedBox(height: 4),
          Text(
            widget.doc["creation_date"],
            style: AppStyle.subTitle,
          ),
          SizedBox(height: 38),
          Text(widget.doc["note_content"],
              style: AppStyle.mainContent,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ]),
      ),
    );
  }
}
