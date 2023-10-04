import 'package:dartz/dartz.dart';

import '../../../modules/home_page/model/books_model.dart';
import '../../Api/exceptions.dart';

abstract class HomePageRepository {
  Future<Either<ServerException, List<BookModel>>> getNewBooks();
  Future<Either<ServerException, List<BookModel>>> getBooks();
}
