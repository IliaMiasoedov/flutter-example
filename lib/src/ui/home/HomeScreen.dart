import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbanking/InjectionContainer.dart';
import 'package:mbanking/src/resource/strings.dart';
import 'package:mbanking/src/ui/home/HomeBlock.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = sl<HomeBloc>();
  }

  @override
  void deactivate() {
    bloc.close();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.homePageName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(Strings.homePageLabel), getCounterView()],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {bloc.increment()},
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget getCounterView() {
    return BlocBuilder<HomeBloc, int>(
      builder: (context, state) {
        return Text(
          '$state',
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}
