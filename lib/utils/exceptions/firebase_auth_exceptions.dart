class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The Email Address is already registered. Please Use a different email Address';
      case 'credential-already-in-use':
        return 'This Credential is already associated with a different account';
      case 'invalid email':
        return 'The Email Address Provided is invalid';
      case 'weak-password':
        return 'The Password is too weak. Please choose a stronger password';
      case 'user-disabled':
        return 'This User account has been disabled. Please contact support for assistance';
      case 'user-not-found':
        return 'Invalid login details. User not found';
      case 'wrong-password':
        return 'Incorrect Password. Please check your password and try again';
      case 'invalid-verification-code':
        return 'Invalid Verification Code. Please Enter the right code';
      case 'invalid-verification-id':
        return 'Invalid Verification ID. Please request a new verification code';
      case 'quota-exceeded':
        return 'Quota Exceeded. PLease Try Again later';
      case 'email-already-exists':
        return 'The Email Address already exists. Please Use a different email Address';
      case 'provider-already-linked':
        return 'The Account is already linked with another provider';
      case 'requires-recent-login':
        return 'This Operation is sensitive and requires recent authentication. Please login in again';
      case 'credentials-already-in-use':
        return 'The Credentials is already associated with a different user account';
      default:
        return 'An unexpected Firebase error occurred. Please try Again';
    }
  }
}
