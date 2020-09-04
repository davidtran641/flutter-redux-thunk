import 'dart:convert';

import 'package:flutter_quote/redux/action.dart';
import 'package:flutter_quote/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;

ThunkAction<AppState> requestQuote = (Store<AppState> store) async {
  http.Response response = await http.get(
    Uri.encodeFull('https://api.kanye.rest/'),
    headers: { 'content-type': 'application/json'}
  );

  print(response.body);
  Map<String, dynamic> result = jsonDecode(response.body);

  String quote = result['quote'];
  String author = "Kanye";
  store.dispatch(
    UpdateQuoteAction(quote: quote, author: author),
  );
};