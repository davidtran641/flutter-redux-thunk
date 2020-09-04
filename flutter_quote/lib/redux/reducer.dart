import 'package:flutter_quote/redux/action.dart';
import 'package:flutter_quote/redux/state.dart';
import 'package:redux/redux.dart';

final reducers = combineReducers<AppState>([
  TypedReducer<AppState, IncrementAction>(_incrementReducer),
  TypedReducer<AppState, UpdateQuoteAction>(_updateQuoteReduce),
]);

AppState _incrementReducer(AppState state, IncrementAction action) {
  return state.clone(counter: state.counter + 1);
}

AppState _updateQuoteReduce(AppState state, UpdateQuoteAction action) {
  return state.clone(quote: action.quote, author: action.author);
}