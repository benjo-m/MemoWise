import 'package:flutter/material.dart';

class NewDeckPage extends StatelessWidget {
  const NewDeckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a new deck"),
      ),
      body: const Center(
        child: Text("New Deck form"),
      ),
    );
  }
}
