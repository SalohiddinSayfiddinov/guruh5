class BookModel {
  final int id;
  final String title;
  final double price;

  BookModel({required this.id, required this.title, required this.price});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? -1,
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
    );
  }
}
