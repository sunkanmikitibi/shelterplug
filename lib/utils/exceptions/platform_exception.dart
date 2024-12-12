class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID-LOGIN-CREDENTIALS':
        return 'Invalid Login Credentials. Please Check your Information and try again';
      case 'too-many-requests':
        return 'Too many requests. Please Try Again later';
      case 'invalid-argument':
        return 'Invalid Argument Provided to the authentication method';
      case 'invalid-password':
        return 'Incorrect Password. Please try again';
      case 'invalid-phone-number':
        return 'The Provided Phone Number is Invalid';
      default:
        return 'An Error as Occurred. Please Try Again';
    }
  }
}
