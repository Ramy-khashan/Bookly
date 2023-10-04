import '../../../core/utils/service_locator.dart';
import '../controller/book_details_cubit.dart';
import 'widgets/book_details.dart';
import '../../home_page/model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/repository/book_details_repository/book_details_repository_impl.dart';
import '../../../core/utils/size_config.dart';
import 'widgets/book_you_like.dart';

class BookDetailsScreen extends StatelessWidget {
  final BookModel book;
  final String categoryType;
  final String tag;
  const BookDetailsScreen(
      {super.key,
      required this.book,
      required this.categoryType,
      required this.tag});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookDetailsCubit(getIt.get<BookDetailRepositoryImpl>())
            ..getBookDetails(book: book)
            ..getSmillerBooks(categoryType: categoryType),
      child: Scaffold(
          body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(100),
                ),
                BookDetailsItem(tag: tag),
                  const BookYouLikeItem()
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: getHeight(30),
              ),
              Padding(
                padding: EdgeInsets.all(getWidth(12)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: getWidth(30),
                          color: Colors.white,
                        )),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
