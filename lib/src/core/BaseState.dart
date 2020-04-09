import 'package:flutter/material.dart';
import 'package:mbanking/src/core/BaseBloc.dart';

abstract class BaseState<T extends StatefulWidget, S extends BaseBloc>
    extends State<T> {

  S bloc;

  S getBlock();

  @override
  void initState() {
    super.initState();
    bloc = getBlock();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
