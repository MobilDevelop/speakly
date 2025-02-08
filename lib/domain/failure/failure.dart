abstract class Failure{}

class FailureServerError extends Failure{
  final String message;

  FailureServerError({required this.message});
}

class FailureServerToken extends Failure{
  final String message;

  FailureServerToken({required this.message});
}