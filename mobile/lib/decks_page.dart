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
        body: const Column(
          children: [
            TotalsContainer(),
            DeckList(),
          ],
        ));
  }
}

class TotalsContainer extends StatelessWidget {
  const TotalsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TotalsCard(
            total: 5,
            title: "Total Decks",
          ),
          TotalsCard(total: 36, title: "Total Cards")
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
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        for (int i = 0; i < 20; i++)
          Card(
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 13, right: 13),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Topic name $i",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    children: [
                      Text("10",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text("12",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text("34",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
      ],
    ));
  }
}
