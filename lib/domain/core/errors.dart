// THESES ARE NOT FAILURES!!!
// These are things that are thrown to crash the app

class NotAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation');
  }
}
