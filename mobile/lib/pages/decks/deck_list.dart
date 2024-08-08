import 'package:flutter/material.dart';
import 'package:mobile/models/deck.dart';

import 'deck_card.dart';

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
