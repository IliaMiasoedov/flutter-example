import 'dart:async';

abstract class BaseBloc<State, Event, Result> {
  State state;
  final StreamController<State> controller = StreamController();

  BaseBloc() {
    state = initState();
    controller.add(state);
  }

  State initState();

  Future<Result> doJob(State state);

  State mapResultToNewState(Result result);

  State mapEventToState(Event event);

  Stream<State> getSteam() {
    return controller.stream;
  }

  void onEvent(Event event) async {
    final result = await doJob(mapEventToState(event));
    state = mapResultToNewState(result);
    controller.add(state);
  }

  void close() {
    controller.close();
  }
}