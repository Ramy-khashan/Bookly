 
import 'package:dartz/dartz.dart';
import '../../../modules/home_page/model/books_model.dart';
import '../../Api/exceptions.dart';
import 'package:dio/dio.dart';
import '../../Api/dio_consumer.dart';
import '../../Api/end_points.dart';
import 'search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final DioConsumer dio;

  SearchRepositoryImpl({required this.dio});
  @override
  Future<Either<ServerException, List<BookModel>>> getBooksBySearch(
      {required String searchBook}) async {
    try {
      final response =
          await dio.get( EndPoints.search + searchBook);

      List<BookModel> searchedBooks = [];
      if (response["totalItems"] > 0) {
        for (var element in response["items"]) {
          searchedBooks.add(BookModel.fromJson(element));
        }
      }
      return right(searchedBooks);
    } catch (e) { 
      if (e is DioError) {
        return left(dio.handleDioError(e));
      } else {
        return left(ServerException(e.toString()));
      }
    }
  }
}
