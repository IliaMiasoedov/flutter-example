import 'package:flutter/cupertino.dart';
import 'package:mbanking/src/core/BaseBloc.dart';
import 'package:mbanking/src/usecases/IncrementCountUseCase.dart';

class HomeBlock extends BaseBloc<int, void, int> {
  final IncrementCountUseCase useCase;

  HomeBlock({@required IncrementCountUseCase useCase})
      : assert(useCase != null),
        useCase = useCase;

  @override
  int initState() => 0;

  @override
  int mapEventToState(void event) => state;

  @override
  int mapResultToNewState(int result) => result;

  @override
  Future<int> doJob(int state) async {
    var result = useCase(Params(number: state));
    return result.then((value) => value.fold((l) => 0, (r) => r));
  }
}