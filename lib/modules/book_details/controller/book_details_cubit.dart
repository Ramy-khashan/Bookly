import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/repository/book_details_repository/book_details_repository_impl.dart';
import '../../home_page/model/books_model.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit(this.bookDetailsRepositoryImpl)
      : super(BookDetailsInitial());
  final BookDetailRepositoryImpl bookDetailsRepositoryImpl;
  static BookDetailsCubit get(context) => BlocProvider.of(context);

  bool isLoadingSmillerBooks = false;
  List<BookModel> smillerBooks = [];
  bool isCrashedSimillerBooks = false;

  getSmillerBooks({required String categoryType}) async {
    isLoadingSmillerBooks = true;
    emit(LoadingSimillerBookState());
    var response = await bookDetailsRepositoryImpl.getSimilarBooks(
        categoryName: categoryType);
    response.fold((failure) {
      isLoadingSmillerBooks = false;
      isCrashedSimillerBooks = true;
      smillerBooks = [];
      emit(FailureSimillerBookState());
    }, (smillerBooks) {
      isLoadingSmillerBooks = false;
      isCrashedSimillerBooks = false;
      this.smillerBooks = smillerBooks;
      emit(SuccessGetSimillerBookState());
    });
  }

  bool isLoadingBookDetails = false;
  BookModel? bookDdetails;

  getBookDetails({required BookModel book}) async {
    bookDdetails = book;
    emit(SuccessGetSimillerBookState());
  }

  List<String> images = [
    "book.png",
    "book1.png",
    "book2.png",
    "book3.png",
  ];
}
