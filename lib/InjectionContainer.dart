import 'package:get_it/get_it.dart';
import 'package:mbanking/src/repository/ActionRepository.dart';
import 'package:mbanking/src/ui/home/HomeBlock.dart';
import 'package:mbanking/src/usecases/IncrementCountUseCase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => ActionRepository());
  sl.registerFactory(() => IncrementCountUseCase(repository: sl()));
  sl.registerLazySingleton(() => HomeBlock(useCase: sl()));
}
