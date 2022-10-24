// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'home_screen/home_screen.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerSubtitle = TextEditingController();
  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todos"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: _controllerTitle,
              decoration: const InputDecoration(
                hintText: 'title',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: _controllerSubtitle,
              decoration: const InputDecoration(
                hintText: 'sub title',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            color: Colors.indigo[900],
            onPressed: () {
              setTask(_controllerTitle.text, _controllerSubtitle.text);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: const Text(
              "save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> setTask(String title, subTitle) async {
    var rng = Random();
    var k = rng.nextInt(10000);
    final ref = fb.ref().child('todos/$k');
    ref.set({
      "title": title,
      "subtitle": subTitle,
    }).asStream();
  }
}
