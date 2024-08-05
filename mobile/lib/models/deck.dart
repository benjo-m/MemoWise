class Deck {
  final int id;
  final String title;
  final int newCards;
  final int learningCards;
  final int learntCards;

  const Deck({
    required this.newCards,
    required this.learningCards,
    required this.learntCards,
    required this.id,
    required this.title,
  });

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      newCards: json['newCards'],
      learningCards: json['learningCards'],
      learntCards: json['learntCards'],
      id: json['id'],
      title: json['title'],
    );
  }
}
