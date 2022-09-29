import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notely/screens/note_details_screen.dart';
import 'package:notely/screens/note_text_screen.dart';
import 'package:notely/widgets/custome_gridview.dart';
import 'package:notely/widgets/drawer.dart';
import '../model/notes_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  noteTextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NoteTextScreen()),
    );
  }

  doSomthin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.dehaze,
            color: Color(0xFF403B36),
            size: 25,
          ),
        ),
        title: const Text(
          "Recent Notes",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Color(0xFF403B36),
            ),
          ),
        ],
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: ValueListenableBuilder<Box<Notes>>(
        valueListenable: Hive.box<Notes>('Notes').listenable(),
        builder: (context, box, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: ListView(
              children: [
                const SizedBox(height: 10),
                // MasonryGridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
                MasonryGridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    var hiveBox = box.getAt(index)!;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NoteDetailsScreen(notes: hiveBox),
                          ),
                        );
                      },
                      child: CustomGridView(notes: hiveBox),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD9614C),
        tooltip: "save your note",
        onPressed: () {
          noteTextScreen();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
