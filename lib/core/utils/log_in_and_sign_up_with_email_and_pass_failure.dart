import '../constants/strings.dart';

class LogInAndSignUpWithEmailAndPassFailure implements Exception {
  const LogInAndSignUpWithEmailAndPassFailure([
    this.message = Strings.anUnknownExceptionOccurred,
  ]);

  factory LogInAndSignUpWithEmailAndPassFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInAndSignUpWithEmailAndPassFailure(
          Strings.invalidEmail,
        );
      case 'user-disabled':
        return const LogInAndSignUpWithEmailAndPassFailure(
          Strings.userDisabled,
        );
      case 'user-not-found':
        return const LogInAndSignUpWithEmailAndPassFailure(
          Strings.userNotFound,
        );
      case 'wrong-password':
        return const LogInAndSignUpWithEmailAndPassFailure(
          Strings.wrongPassword,
        );
      case 'invalid-credential':
        return const LogInAndSignUpWithEmailAndPassFailure(
          Strings.invalidCredential,
        );
        case 'email-already-in-use':
        return const LogInAndSignUpWithEmailAndPassFailure(
          Strings.emailAlreadyInUse,
        );
        case 'operation-not-allowed':
        return const LogInAndSignUpWithEmailAndPassFailure(
          Strings.operationNotAllowed,
        );
        case 'weak-password':
        return const LogInAndSignUpWithEmailAndPassFailure(
          Strings.weakPassword,
        );
      default:
        return const LogInAndSignUpWithEmailAndPassFailure();
    }
  }

  final String message;
}
