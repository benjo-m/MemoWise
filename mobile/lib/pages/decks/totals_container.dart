import 'package:flutter/material.dart';

import 'totals_card.dart';

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
