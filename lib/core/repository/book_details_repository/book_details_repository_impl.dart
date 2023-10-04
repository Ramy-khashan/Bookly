 

import '../../api/end_points.dart';
import '../../api/exceptions.dart';
import '../../../modules/home_page/model/books_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../Api/dio_consumer.dart';
import 'book_details_repository.dart';

class BookDetailRepositoryImpl implements BookDetialsRepository {
  final DioConsumer dio;

  BookDetailRepositoryImpl({required this.dio});
  @override
  Future<Either<ServerException, BookModel>> getBookDetails(
      {required String bookId}) async {
    try {
      var bookDetails = await dio.get('${EndPoints.baseUrl}volumes/$bookId'); 
      return right(BookModel.fromJson(bookDetails));
    } catch (e) {
      if (e is DioError) {
        return left(dio.handleDioError(e));
      } else {
        return left(ServerException(e.toString()));
      }
    }
  }

  @override
  Future<Either<ServerException, List<BookModel>>> getSimilarBooks(
      {required String categoryName}) async {
    try {
      final similarBooks = await dio
          .get("volumes?Filtering=free &q=$categoryName");
      List<BookModel> similarBookItem = [];

      for (var element in similarBooks["items"]) {
        similarBookItem.add(BookModel.fromJson(element));
      }
      return right(similarBookItem);
    } catch (e) {
      if (e is DioError) {
        return left(dio.handleDioError(e));
      } else {
        return left(ServerException(e.toString()));
      }
    }
  }
}
