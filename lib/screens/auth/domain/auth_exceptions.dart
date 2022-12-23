class WrongCredentialsException implements Exception {
  const WrongCredentialsException();
  @override
  String toString() {
    return 'Wrong email or password';
  }
}

class WrongLinkException implements Exception {
  const WrongLinkException();
  @override
  String toString() {
    return 'The resource you requested was not found';
  }
}

class WrongRegistrationException implements Exception {
  const WrongRegistrationException();
  @override
  String toString() {
    return 'This user is already registered';
  }
}

class WrongLoginDataException implements Exception {
  const WrongLoginDataException();
  @override
  String toString() {
    return 'Invalid identifier or password';
  }
}
