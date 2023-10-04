import '../../api/end_points.dart';
import 'home_page_repository.dart';
import '../../../modules/home_page/model/books_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../Api/dio_consumer.dart';
import '../../Api/exceptions.dart';

class HomePageRepositoryImpl implements HomePageRepository {
  final DioConsumer dio;

  HomePageRepositoryImpl({required this.dio});
  @override
  Future<Either<ServerException, List<BookModel>>> getBooks() async {
    try {
      List<BookModel> books = [];
      final response = await dio.get(EndPoints.books);
      for (var element in response["items"]) {
        books.add(BookModel.fromJson(element));
      } 
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          dio.handleDioError(e),
        );
      }
      return left(
        ServerException(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ServerException, List<BookModel>>> getNewBooks() async {
    try {
      List<BookModel> newBooks = [];
      final response = await dio.get(EndPoints.baseUrl + EndPoints.newBooks);
      for (var element in response["items"]) {
        newBooks.add(BookModel.fromJson(element));
      }
      return right(newBooks);
    } catch (e) {
      if (e is DioError) {
        return left(
          dio.handleDioError(e),
        );
      }
      return left(
        ServerException(
          e.toString(),
        ),
      );
    }
  }
}
