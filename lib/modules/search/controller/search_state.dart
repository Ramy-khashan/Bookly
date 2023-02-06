part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class LoadingSearchState extends SearchState {}

class SuccessgSearchState extends SearchState {
  final List<BookModel> searchBooks;

  const SuccessgSearchState({required this.searchBooks});
}

class FaildSearchState extends SearchState {}
