import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-mm-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en-US', symbol: '₦').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    //Assuming a 11-digit Number
    if(phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 7)}) ${phoneNumber.substring(7)}';
    } else {
      return '(${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)}) ${phoneNumber.substring(6)}';
    }
    // ignore: dead_code
    return phoneNumber;
  }
}