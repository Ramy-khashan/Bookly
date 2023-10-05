import '../../../core/utils/app_string.dart';
import '../../../core/widgets/image_with_txet.dart';
import 'widgets/search_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/differant_loading_book_item.dart';
import '../../../core/widgets/error_shape.dart';
import '../../../core/widgets/show_book_info.dart';
import '../../book_details/view/book_details_screen.dart';
import '../controller/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if (!focusScopeNode.hasPrimaryFocus) {
          return focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          children: [
            SearchPartItem(onChange: (val) {
              if (val.toString().isNotEmpty) {
                BlocProvider.of<SearchCubit>(context).search(val);
              }
            }),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is FaildSearchState) {
                    return const ErrorShape();
                  } else if (state is SuccessgSearchState) {
                    return state.searchBooks.isEmpty
                        ? const ImageWithTextItem(
                            image: AppAssets.notFoundImage,
                            head: AppString.searchEmpty)
                        : GridView.builder(
                          padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            mainAxisExtent: 220,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 17,
                            mainAxisSpacing: 20),
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BookDetailsScreen(
                                                  tag: state
                                                      .searchBooks[index].id!,
                                                  book:
                                                      state.searchBooks[index],
                                                  categoryType: state
                                                              .searchBooks[
                                                                  index]
                                                              .volumeInfo
                                                              ?.categories ==
                                                          null
                                                      ? "all"
                                                      : state
                                                          .searchBooks[index]
                                                          .volumeInfo
                                                          ?.categories![0]),
                                        ));
                                  },
                                  child: ShowBookInfoItem(
                                      id: state.searchBooks[index].id!,
                                      bookImage: state.searchBooks[index].volumeInfo?.imageLinks == null
                                          ? ""
                                          : state.searchBooks[index].volumeInfo
                                                  ?.imageLinks!.thumbnail ??
                                              "",
                                      bookTitle:
                                          state.searchBooks[index].volumeInfo?.title ??
                                              "Title",
                                      bookAuther:
                                          state.searchBooks[index].volumeInfo?.authors == null
                                              ? "Auther Not Detect"
                                              : state.searchBooks[index]
                                                  .volumeInfo?.authors![0],
                                      bookPrice: state.searchBooks[index]
                                                  .saleInfo!.saleability ==
                                              "FOR_SALE"
                                          ? "${state.searchBooks[index].saleInfo!.listPrice?.amount.toString() ?? "Not Detect"} \$"
                                          : "Free",
                                      bookRate: (state.searchBooks[index].volumeInfo?.averageRating ?? 0).toString(),
                                      bookViewer: (state.searchBooks[index].volumeInfo?.ratingsCount.toString() ?? "0")),
                                ),
                      
                            itemCount: state.searchBooks.length);
                  } else if (state is LoadingSearchState) {
                    return const DifferantLoadingBookItem();
                  } else {
                    return const ImageWithTextItem(
                      image: AppAssets.searchImage,
                      head: AppString.startSearch,
                    );
                  }
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
