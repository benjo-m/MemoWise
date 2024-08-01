import 'package:flutter/material.dart';
import 'package:mobile/new_deck_page.dart';

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
          backgroundColor: Colors.amber,
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text("New Deck"),
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NewDeckPage()));
          },
          isExtended: true,
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TotalsCard(
                total: 5,
                title: "Total Decks",
              ),
              SizedBox(
                width: 20,
              ),
              TotalsCard(total: 36, title: "Total Cards")
            ],
          ),
        ));
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
        color: const Color.fromARGB(255, 255, 226, 138),
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
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
