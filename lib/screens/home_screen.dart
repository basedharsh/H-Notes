import "package:cloud_firestore/cloud_firestore.dart";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "package:hnotes/screens/delete_notes.dart";
import "package:hnotes/screens/edit_note.dart";
import "package:hnotes/screens/read_note.dart";
import "package:hnotes/style/style.dart";
import "package:hnotes/widget/note_card.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppStyle.primaryColor,
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF365486),
      //   centerTitle: true,
      //   elevation: 50,
      //   title: const Text("H Notes",
      //       style: TextStyle(
      //           //gradient color
      //           decoration: TextDecoration.underline,
      //           color: Colors.yellowAccent)),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Bg.jpg"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Your Recent Notes",
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the delete page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeleteNoteScreen(),
                      ),
                    );
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("notes")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          children: snapshot.data!.docs
                              .map((note) => noteCard(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ReadNoteScreen(note),
                                        ));
                                  }, note))
                              .toList());
                    }
                    return Text(
                      "No Notes",
                      style: GoogleFonts.nunito(color: Colors.white),
                    );
                  }),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNoteScreen(),
              ));
        },
        label: Text("Add Note"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
