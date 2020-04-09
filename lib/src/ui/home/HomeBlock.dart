import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbanking/src/usecases/IncrementCountUseCase.dart';

class HomeBloc extends Bloc<int, int> {
  final IncrementCountUseCase useCase;
  var count = 0;

  HomeBloc({@required IncrementCountUseCase useCase})
      : assert(useCase != null),
        useCase = useCase;

  @override
  int get initialState => count;

  void increment() {
    add(count);
  }

  @override
  Stream<int> mapEventToState(void event) async* {
    final result = await useCase(Params(number: state));
    result.fold((l) => count = 0, (r) => count = r);
    yield count;
  }
}