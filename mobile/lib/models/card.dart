class Card {
  final int id;
  final String frontText;
  final String backText;
  final String status;

  const Card({
    required this.id,
    required this.frontText,
    required this.backText,
    required this.status,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
        id: json['id'],
        frontText: json['frontText'],
        backText: json['backText'],
        status: json['status']);
  }
}
