import '../../../core/repository/home_page_repository/home_page_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/books_model.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._homePageRepositoryImpl) : super(HomePageInitial());
  final HomePageRepositoryImpl _homePageRepositoryImpl;
  static HomePageCubit get(context) => BlocProvider.of(context);
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  bool isLoadingNewBook = false;
  List<BookModel> newBooks = [];

  getNewBooks() async {
    isLoadingNewBook = true;
    emit(LoadingNewBookState());
    var response = await _homePageRepositoryImpl.getNewBooks();
    response.fold((failuer) {
      isLoadingNewBook = false;

      emit(FaildGetNewBookState(errorMessage: failuer.message!));
    }, (newBook) {
      isLoadingNewBook = false;
      newBooks = newBook;
      emit(SuccessGetNewBookState());
    });
  }

  bool isLoadingBestSellerBook = false;
  List<BookModel> bestSellerBooks = [];
  getFreeBestSellerBooks() async {
    isLoadingBestSellerBook = true;

    emit(LoadingBestSellerBookState());

    var response = await _homePageRepositoryImpl.getBooks();
    response.fold((failuer) {
      isLoadingBestSellerBook = false;
      emit(FailureBestSellerBookState());
    }, (books) { 
      isLoadingBestSellerBook = false;

      bestSellerBooks = books;
      emit(SuccessLoadingBestSellerBookState());
    });
  }
}
