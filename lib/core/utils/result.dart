import 'package:equatable/equatable.dart';

abstract class Result<T> extends Equatable {
  const Result();
}

class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;

  @override
  List<Object?> get props => [data];
}

class Failure<T> extends Result<T> {
  const Failure(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
