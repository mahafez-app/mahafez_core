import '../error/result.dart';

/// Base contract for parameterized asynchronous UseCases.
abstract interface class UseCase<T, P> {
  Future<Result<T>> call(P params);
}

/// Base contract for non-parameterized asynchronous UseCases.
abstract interface class NoParamsUseCase<T> {
  Future<Result<T>> call();
}

/// Base contract for parameterized Stream UseCases.
abstract interface class StreamUseCase<T, P> {
  Stream<Result<T>> call(P params);
}

/// Base contract for non-parameterized Stream UseCases.
abstract interface class NoParamsStreamUseCase<T> {
  Stream<Result<T>> call();
}
