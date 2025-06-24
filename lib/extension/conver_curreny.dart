import 'package:intl/intl.dart';

class ConverCurreny {
  NumberFormat convertCurreny() {
    final currentFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    return currentFormat;
  }
}
