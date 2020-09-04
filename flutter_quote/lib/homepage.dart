import 'package:flutter/material.dart';
import 'package:flutter_quote/redux/action.dart';
import 'package:flutter_quote/redux/request_quote_middleware.dart';
import 'package:flutter_quote/redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MyHomePageViewModel {
  final int counter;
  final String quote;
  final String author;
  final Function onSelectFavorite;
  final Function onRefreshQuote;

  MyHomePageViewModel(
      {this.counter,
      this.quote,
      this.author,
      this.onSelectFavorite,
      this.onRefreshQuote});

  factory MyHomePageViewModel.make(Store<AppState> store) {
    return MyHomePageViewModel(
      counter: store.state.counter,
      quote: store.state.quote,
      author: store.state.author,
      onSelectFavorite: () {
        store.dispatch(IncrementAction());
      },
      onRefreshQuote: () {
        store.dispatch(requestQuote);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MyHomePageViewModel>(
      converter: (store) => MyHomePageViewModel.make(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  viewModel.quote,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                Text(
                  viewModel.author,
                  style: Theme.of(context).textTheme.caption,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${viewModel.counter}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
                FlatButton(
                  child: Text('Generate new quote'),
                  onPressed: viewModel.onRefreshQuote,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: viewModel.onSelectFavorite,
            tooltip: 'Increment',
            child: Icon(Icons.favorite),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
