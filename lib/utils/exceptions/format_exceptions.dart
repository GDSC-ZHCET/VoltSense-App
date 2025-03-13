/// Custom exception class to handle various format-related errors.
class VFormatException implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const VFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message.
  factory VFormatException.fromMessage(String message) {
    return VFormatException(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory VFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const VFormatException(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const VFormatException(
            'The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const VFormatException(
            'The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const VFormatException(
            'The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const VFormatException(
            'The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const VFormatException(
            'The input should be a valid numeric format.');
      // Add more cases as needed...
      default:
        return const VFormatException();
    }
  }
}
