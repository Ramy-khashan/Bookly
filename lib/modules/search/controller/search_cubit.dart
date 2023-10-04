 
import '../../../core/repository/search_repository/search_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_page/model/books_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepositoryImpl searchRepositoryImpl;
  SearchCubit(this.searchRepositoryImpl) : super(SearchInitial());
  search(String book) async {
    emit(LoadingSearchState());

    final searchResult =
        await searchRepositoryImpl.getBooksBySearch(searchBook: book);
    searchResult.fold((l) { 
      emit(FaildSearchState());
    }, (searchBooks) => emit(SuccessgSearchState(searchBooks: searchBooks)));
  }
}
