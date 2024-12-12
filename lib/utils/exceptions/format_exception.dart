class TFormatException implements Exception {
  final String message;

  const TFormatException(
      [this.message =
          'An Unexpected format error occurred. Please check your input']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException('The email address is invalid');
      case 'invalid-phone-number-format':
        return const TFormatException(
            'The Provided Phone Number format is invalid. Please Enter a valid Number');
      case 'invalid-date-format':
        return const TFormatException(
            'The date format is invalid. Please enter a valid date');
      case 'invalid-url-format':
        return const TFormatException(
            'The URL Format is invalid. Please Enter a valid URL');
      default:
        return const TFormatException();
    }
  }
}
