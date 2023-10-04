import '../../api/exceptions.dart';
import '../../../modules/home_page/model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class BookDetialsRepository {
  Future<Either<ServerException, BookModel>> getBookDetails(
      {required String bookId});
  Future<Either<ServerException, List<BookModel>>> getSimilarBooks(
      {required String categoryName});
}
