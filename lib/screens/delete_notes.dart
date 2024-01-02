import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteNoteScreen extends StatefulWidget {
  const DeleteNoteScreen({super.key});

  @override
  State<DeleteNoteScreen> createState() => _DeleteNoteScreenState();
}

class _DeleteNoteScreenState extends State<DeleteNoteScreen> {
  List<String> selectedNoteIds = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/Bg.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "Select Notes to Delete",
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!.docs
                          .map(
                            (note) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(16),
                                  title: Text(
                                    note['note_title'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  leading: Checkbox(
                                    value: selectedNoteIds.contains(note.id),
                                    onChanged: (bool? value) {
                                      toggleSelect(note.id);
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                  return Text(
                    "No Notes",
                    style: GoogleFonts.nunito(color: Colors.black),
                  );
                }),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle delete operation for selected notes
              deleteSelectedNotes();
              Navigator.pop(context); // Close the delete page after deletion
            },
            child: Text("Delete"),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }

  void toggleSelect(String noteId) {
    setState(() {
      if (selectedNoteIds.contains(noteId)) {
        selectedNoteIds.remove(noteId);
      } else {
        selectedNoteIds.add(noteId);
      }
    });
  }

  void deleteSelectedNotes() {
    for (String noteId in selectedNoteIds) {
      print(noteId);
      FirebaseFirestore.instance.collection("notes").doc(noteId).delete();
    }
  }
}
