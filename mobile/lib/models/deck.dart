import 'package:mobile/models/card.dart';

class Deck {
  final int id;
  final String title;
  final List<Card> cards;

  const Deck({
    required this.id,
    required this.title,
    required this.cards,
  });

  factory Deck.fromJson(Map<String, dynamic> json) {
    var cardsJson = json['cards'] as List;
    List<Card> cardList =
        cardsJson.map((cardJson) => Card.fromJson(cardJson)).toList();

    return Deck(
      id: json['id'],
      title: json['title'],
      cards: cardList,
    );
  }
}
