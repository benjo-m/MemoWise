import 'package:flutter/material.dart';
import 'package:mobile/models/deck.dart';
import 'package:mobile/new_deck_page.dart';

import 'deck_list.dart';
import 'totals_container.dart';
import 'utils.dart';

class DecksPage extends StatefulWidget {
  const DecksPage({
    super.key,
  });

  @override
  State<DecksPage> createState() => _DecksPageState();
}

class _DecksPageState extends State<DecksPage> {
  late Future<List<Deck>> futureDecks;

  @override
  void initState() {
    super.initState();
    futureDecks = fetchDecks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Decks',
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text("New Deck"),
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NewDeckPage()));
          },
        ),
        body: FutureBuilder(
          future: futureDecks,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Deck> decks = snapshot.data!;
              return Column(
                children: [
                  TotalsContainer(
                    totalDecks: decks.length,
                    totalCards: calculateCards(decks),
                  ),
                  DeckList(decks: decks),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
