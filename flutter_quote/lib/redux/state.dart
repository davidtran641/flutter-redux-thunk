class AppState {
  final int counter;
  final String quote;
  final String author;

  AppState({this.counter, this.quote, this.author});

  factory AppState.initial() {
    return AppState(counter: 0, quote: '', author: '');
  }

  AppState clone({int counter, String quote, String author}) {
    return AppState(
      counter: counter ?? this.counter,
      quote: quote ?? this.quote,
      author: author ?? this.author,
    );
  }
}
