class Currency {
  String name = "undefined";
  String symbol = "undefined";
  double rateToUah = 1;

  Currency();
  Currency.usd() {
    name = "Долар США";
    symbol = "USD";
    rateToUah = 27.3317;
  }
  Currency.euro() {
    name = "Євро";
    symbol = "EUR";
    rateToUah = 30.7277;
  }
  Currency.uah() {
    name = "Гривня";
    symbol = "UAH";
    rateToUah = 1;
  }
}
