import 'package:flutter/material.dart';

import '../add_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: GestureDetector(
        onTap: () {
          setState(() {});

          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'title',
                  ),
                ),
              ),
              content: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
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
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
