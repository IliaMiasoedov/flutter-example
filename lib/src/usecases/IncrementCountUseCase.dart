import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mbanking/src/network/failures.dart';
import 'package:mbanking/src/repository/ActionRepository.dart';
import 'package:mbanking/src/usecases/usecase.dart';

class IncrementCountUseCase extends UseCase<int, Params> {
  final ActionRepository repository;

  IncrementCountUseCase({@required ActionRepository repository}) :
        assert(repository != null),
        repository = repository;

  Future<Either<Failure, int>> call(Params params) async {
    final result = await repository.increment(params.number);
    return right(result);
  }
}

class Params extends Equatable {
  final int number;

  Params({@required this.number});

  @override
  List<Object> get props => [number];
}