import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/models/deck.dart';
import 'package:mobile/new_deck_page.dart';
import 'package:http/http.dart' as http;

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

class TotalsContainer extends StatelessWidget {
  const TotalsContainer({
    super.key,
    required this.totalDecks,
    required this.totalCards,
  });

  final int totalDecks;
  final int totalCards;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TotalsCard(
            total: totalDecks,
            title: "Total Decks",
          ),
          TotalsCard(total: totalCards, title: "Total Cards")
        ],
      ),
    );
  }
}

class TotalsCard extends StatelessWidget {
  const TotalsCard({
    super.key,
    required this.total,
    required this.title,
  });

  final String title;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 40, right: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "$total",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class DeckList extends StatelessWidget {
  const DeckList({
    super.key,
    required this.decks,
  });

  final List<Deck> decks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: decks
          .map(
            (Deck deck) => DeckCard(
              deck: deck,
            ),
          )
          .toList(),
    ));
  }
}

class DeckCard extends StatelessWidget {
  const DeckCard({
    super.key,
    required this.deck,
  });

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20, left: 13, right: 13),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                deck.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Text("${deck.newCards}",
                    style: const TextStyle(
                      fontSize: 16,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text("${deck.learningCards}",
                    style: const TextStyle(
                      fontSize: 16,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text("${deck.learntCards}",
                    style: const TextStyle(
                      fontSize: 16,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// List<Deck> parseDecks(String jsonString) {
//   final List<dynamic> decodedList = jsonDecode(jsonString);
//   return decodedList.map((json) => Deck.fromJson(json)).toList();
// }

// Future<List<Deck>> fetchDecks() async {
//   final response = await http.get(Uri.parse('https://10.0.2.2:7066/api/Deck'));

//   if (response.statusCode == 200) {
//     return parseDecks(response.toString());
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

Future<List<Deck>> fetchDecks() async {
  var res = await http.get(Uri.parse("https://10.0.2.2:7066/api/Deck"));

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);

    List<Deck> decks = body
        .map(
          (dynamic item) => Deck.fromJson(item),
        )
        .toList();

    return decks;
  } else {
    throw "Unable to retrieve decks.";
  }
}

int calculateCards(List<Deck> decks) {
  int totalCards = 0;

  for (var deck in decks) {
    totalCards += deck.newCards;
    totalCards += deck.learningCards;
    totalCards += deck.learntCards;
  }

  return totalCards;
}
