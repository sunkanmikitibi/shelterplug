class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. please try again';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please try again';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience';
      case 'user-disabled':
        return 'The user account has been disabled';
      case 'user-not-found':
        return 'No user found for the given email or UID';
      case 'invalid email':
        return 'The Email Address Provided is invalid';
      case 'email-already-in-use':
        return 'The Email address is already registered. Please Use a different Email';
      case 'wrong-password':
        return 'Incorrect Password. Please check your password and try again';
      case 'operation-not-allowed':
        return 'This operation is not allowed., contact support for assistance';
      case 'invalid-verification-code':
        return 'Invalid Verification Code. Please Enter a valid verification code';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password';
      case 'captcha-check-failed':
        return 'The recaptcha response is invalid!. Please try again';
      case 'keychain-error':
        return 'A Keychain error occurred. Please check the keychain and try again!';
      case 'provider-already-linked':
        return 'The Account is already linked with another provider';
      case 'internal-error':
        return 'An Internal Authentication Error occurred. Please check the keychain and try again!';
      case 'invalid-app-credential':
        return 'A Keychain error occurred. Please check the keychain and try again!';
      default:
        return 'An Error as Occurred. Please Try Again';
    }
  }
}
