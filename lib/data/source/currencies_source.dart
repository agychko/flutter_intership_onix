
import 'package:first/data/model/currency.dart';

class CurrenciesSource {
  Future<List<Currency>> getCurrencies() => Future.delayed(
      const Duration(milliseconds: 2000),
          () => [
        Currency(
            0,
            'https://flagcdn.com/w80/ua.png',
            '₴',
            'Ukrainian Hryvna',
            'UAH',
            1.0
        ),
        Currency(
            1,
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png',
            ' €',
            'Euro',
            'EUR',
            30.7277
        ),
        Currency(
            2,
            'https://flagcdn.com/w80/us.png',
            '\$',
            'American dollar',
            'USD',
            27.3317
        )
      ]);
}