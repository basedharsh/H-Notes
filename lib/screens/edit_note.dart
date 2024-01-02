import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hnotes/style/style.dart';
import 'package:hnotes/widget/note_card.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  String Date = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
          backgroundColor: AppStyle.cardsColor[color_id],
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Add New Note",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Note Title",
                  hintStyle: AppStyle.mainTitle,
                  border: InputBorder.none,
                ),
                style: AppStyle.mainTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                Date,
                style: AppStyle.subTitle,
              ),
              SizedBox(
                height: 28,
              ),
              TextField(
                controller: _contentController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Note Content",
                  hintStyle: AppStyle.mainContent,
                  border: InputBorder.none,
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.save, color: Colors.black),
          label: Text("Save", style: TextStyle(color: Colors.black)),
          onPressed: () {
            FirebaseFirestore.instance.collection("notes").add({
              "note_title": _titleController.text,
              "creation_date": Date,
              "note_content": _contentController.text,
              "color_id": color_id
            }).then((value) {
              {
                print(value.id);
                Navigator.pop(context);
              }
            }).catchError((error) {
              print(error);
              print("Something went wrong");
            });
          }),
    );
  }
}
