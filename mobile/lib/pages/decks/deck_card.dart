import 'package:flutter/material.dart';
import 'package:mobile/models/deck.dart';

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
                Text(
                    "${deck.cards.where((card) => card.status == 'New').length}",
                    style: const TextStyle(
                      fontSize: 16,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                    "${deck.cards.where((card) => card.status == 'Learning').length}",
                    style: const TextStyle(
                      fontSize: 16,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                    "${deck.cards.where((card) => card.status == 'Learned').length}",
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
