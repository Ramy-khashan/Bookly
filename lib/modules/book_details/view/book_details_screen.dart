import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/modules/book_details/controller/book_details_cubit.dart';
import 'package:bookly/modules/book_details/view/widgets/book_details.dart';
import 'package:bookly/modules/home_page/model/books_model.dart';
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
      {super.key, required this.book, required this.categoryType, required this.tag});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookDetailsCubit(getIt.get<BookDetailRepositoryImpl>())
            ..getBookDetails(book: book)
            ..getSmillerBooks(categoryType: categoryType),
      child: Scaffold(
          body: SafeArea(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getHeight(10),
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
                      Icons.close,
                      size: getWidth(30),
                      color: Colors.white,
                    )),
                const Spacer(),
              
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children:   [
                  BookDetailsItem(tag:tag
                     ),
                  const BookYouLikeItem()
                ],
              ),
            ),
          )
        ],
      ))),
    );
  }
}
