class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exists for that email.');
      case 'user-not-found':
        return const SignUpWithEmailAndPasswordFailure(
            'No user found for that email.');
      case 'wrong-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Wrong password provided for that user.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help');

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
