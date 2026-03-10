class QuoteModel {
  final int id;
  final String text;
  final String author;

  const QuoteModel({required this.id, required this.text, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['id'] as int,
      text: json['quote'] as String,
      author: json['author'] as String,
    );
  }
}

