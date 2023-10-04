import '../../../modules/home_page/model/books_model.dart';
import 'package:dartz/dartz.dart';

import '../../Api/exceptions.dart';

abstract class SearchRepository {
  Future<Either<ServerException, List<BookModel>>> getBooksBySearch( {required String searchBook});
}
