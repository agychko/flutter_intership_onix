class CurrencyResponse {
  final bool success;
  final int timestamp;
  final String base;
  final String date;
  final Map rates;

  CurrencyResponse ({
    required this.success,
    required this.timestamp,
    required this.base,
    required this.date,
    required this.rates
  });
  factory CurrencyResponse.fromJson(json) {
    return CurrencyResponse(
        success: json['success'],
        timestamp: json['timestamp'],
        base: json['base'],
        date: json['date'],
      rates: json['rates']
    );
  }
}