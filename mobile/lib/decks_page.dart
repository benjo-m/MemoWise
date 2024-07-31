import 'package:flutter/material.dart';

class DecksPage extends StatelessWidget {
  const DecksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Decks',
        ),
        backgroundColor: Colors.amberAccent,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("New Deck"),
        icon: const Icon(Icons.add),
        onPressed: () {
          null;
        },
        isExtended: true,
      ),
      body: const Center(child: Text('Decks')),
    );
  }
}
