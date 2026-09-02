sealed class Failure {
  const Failure(this.message);
  final String message;
}
final class CacheFailure extends Failure { const CacheFailure(super.message); }
final class UnexpectedFailure extends Failure { const UnexpectedFailure(super.message); }
