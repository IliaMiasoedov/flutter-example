import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbanking/InjectionContainer.dart';
import 'package:mbanking/src/core/BaseState.dart';
import 'package:mbanking/src/resource/strings.dart';
import 'package:mbanking/src/ui/home/HomeBlock.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends BaseState<HomeScreen, HomeBlock> {
  @override
  HomeBlock getBlock() => sl<HomeBlock>();

  @override
  Widget build(BuildContext context) => buildUi();

  Widget buildUi() {
    return Scaffold(
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
        onPressed: () => {bloc.onEvent(null)},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getCounterView() {
    return StreamBuilder(
      stream: bloc.getSteam(),
      builder: (context, d) {
        var count = 0;
        if (d.hasData) {
          count = d.data;
        }
        return Text(
          '$count',
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}
