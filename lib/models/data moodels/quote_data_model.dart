class QuoteDataModel {
  final String advice;

  QuoteDataModel({required this.advice});

  // Factory method to create a Quote from a JSON response
  factory QuoteDataModel.fromJson(Map<String, dynamic> json) {
    return QuoteDataModel(
      advice: json['slip']['advice'],
    );
  }
}
