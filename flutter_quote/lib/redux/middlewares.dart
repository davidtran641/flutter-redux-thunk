import 'package:flutter_quote/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

List<Middleware<AppState>> createMiddleware() {
  return [thunkMiddleware];
}