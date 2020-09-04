import 'package:flutter/material.dart';
import 'package:flutter_quote/redux/middlewares.dart';
import 'package:flutter_quote/redux/reducer.dart';
import 'package:flutter_quote/redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'homepage.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final store = Store<AppState>(
    reducers,
    initialState: AppState.initial(),
    middleware: createMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Daily quote',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Daily quote'),
      ),
    );
  }
}
