import '../models/Book.dart';
//نور حنان
abstract class StatesForlibraryApp {}

class InitialStateForlibraryApp extends StatesForlibraryApp {}

class StateReadyForFetchingbooks extends StatesForlibraryApp {}

class StateFetchingBooksSuccessfully extends StatesForlibraryApp {
  final List<Book> books;

  StateFetchingBooksSuccessfully({required this.books});
}

class StateFetchingBooksUnsuccessfully extends StatesForlibraryApp {
  final String errorExp;

  StateFetchingBooksUnsuccessfully({required this.errorExp});
}

