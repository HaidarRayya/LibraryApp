import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/statesForlibraryApp.dart';
import 'dart:convert' as convert;
import '../models/Book.dart';
//حيدر ريا
class CubitForLibraryApp extends Cubit<StatesForlibraryApp> {
  CubitForLibraryApp() : super(InitialStateForlibraryApp());

  Future<List<Book>> fetchingBoods() async {
    List<Book> books = [];
    var response = await http.get(Uri.parse("http://10.0.2.2:8000/api/books"));
    if(response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      for (int i = 0; i < jsonResponse['books'].length; i++) {
        books.add(Book(
            id: jsonResponse['books'][i]['id'] as int,
            title: jsonResponse['books'][i]['title'] as String,
            author: jsonResponse['books'][i]['author'] as String,
            descripation: jsonResponse['books'][i]['descripation'] as String,
            category: jsonResponse['books'][i]['category'] as String,
            numbersOfBooks: jsonResponse['books'][i]['numbersOfBooks'] as int,
            price: jsonResponse['books'][i]['price'] as double)
        );
      }
    }else{
        throw Exception("Falid Loding Books");
    }
    //نور حنان
    try {
      emit(StateReadyForFetchingbooks());
      emit(StateFetchingBooksSuccessfully(books: books));
    } catch (errorExp) {
      emit(StateFetchingBooksUnsuccessfully(
          errorExp: errorExp.toString()));
    }
    return books;
  }
}