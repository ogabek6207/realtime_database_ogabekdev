import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../add_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fb = FirebaseDatabase.instance;
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerSubtitle = TextEditingController();
  var l;
  var g;
  var k;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const AddNoteScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Todos',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: FirebaseAnimatedList(
        query: ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          var v = snapshot.value.toString();

          g = v.replaceAll(RegExp("{|}|subtitle: |title: "), "");
          g.trim();

          l = g.split(',');

          return GestureDetector(
            onTap: () {
              setState(() {
                k = snapshot.key;
              });

              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: TextField(
                      controller: _controllerTitle,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'title',
                      ),
                    ),
                  ),
                  content: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: TextField(
                      controller: _controllerSubtitle,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'sub title',
                      ),
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      color: const Color.fromARGB(255, 0, 22, 145),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await updateTask();
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      color: const Color.fromARGB(255, 0, 22, 145),
                      child: const Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.indigo[100],
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                  onPressed: () {
                    ref.child(snapshot.key!).remove();
                  },
                ),
                title: Text(
                  l[1],
                  // 'dd',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  l[0],
                  // 'dd',

                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  updateTask() async {
    DatabaseReference ref1 = FirebaseDatabase.instance.ref("todos/$k");

    await ref1.update({
      "title": _controllerTitle.text,
      "subtitle": _controllerSubtitle.text,
    });
    _controllerTitle.clear();
    _controllerSubtitle.clear();
  }
}
