import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mobile/models/deck.dart';

Future<List<Deck>> fetchDecks() async {
  var res = await http.get(Uri.parse("https://10.0.2.2:7066/api/Deck"));
  return (json.decode(res.body) as List).map((i) => Deck.fromJson(i)).toList();
}

int calculateCards(List<Deck> decks) {
  int totalCards = 0;

  for (var deck in decks) {
    totalCards += deck.cards.length;
  }

  return totalCards;
}
