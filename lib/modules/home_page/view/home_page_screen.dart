import 'package:bookly/core/utils/app_assets.dart';
import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/modules/home_page/controller/home_page_cubit.dart';
import 'package:bookly/core/widgets/differant_loading_book_item.dart';
import 'package:bookly/core/widgets/show_book_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../../core/widgets/error_shape.dart';
import '../../book_details/view/book_details_screen.dart';
import '../../search/view/search_screen.dart';
import 'widgets/new_loading_item.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: () async {
          HomePageCubit.get(context)
            ..getFreeBestSellerBooks()
            ..getNewBooks();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getHeight(20),
            ),
            Padding(
              padding: EdgeInsets.all(getWidth(12)),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.appLogo,
                    scale: 3,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ));
                      },
                      icon: Icon(
                        Icons.search,
                        size: getWidth(27),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: getHeight(15),
            ),
            SizedBox(
              height: getHeight(250),
              child: BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  final controller = HomePageCubit.get(context);

                  return controller.isLoadingNewBook
                      ? const NewLoadingItem()
                      : controller.newBooks.isEmpty
                          ? const ErrorShape()
                          : ListView.separated(
                              padding: EdgeInsets.all(getWidth(12)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BookDetailsScreen(
                                                tag:controller
                                                      .newBooks[index].id! ,
                                                  book: controller
                                                      .newBooks[index],
                                                  categoryType: controller
                                                              .newBooks[index]
                                                              .volumeInfo
                                                              ?.categories ==
                                                          null
                                                      ? "all"
                                                      : controller
                                                          .newBooks[index]
                                                          .volumeInfo
                                                          ?.categories![0]),
                                        ));
                                  },
                                  child:  Hero(
                    tag: controller.newBooks[index].id!,
                                    child: CustomNetworkImage(
                                      radius: 15,
                                      height: 250,
                                      width: 135,
                                      imageUrl: controller.newBooks[index]
                                                  .volumeInfo?.imageLinks ==
                                              null
                                          ? ""
                                          : controller.newBooks[index].volumeInfo
                                                  ?.imageLinks!.thumbnail ??
                                              "",
                                    ),
                                  ),
                                );
                              },
                              itemCount: controller.newBooks.length,
                              separatorBuilder: (context, index) => SizedBox(
                                width: getWidth(15),
                              ),
                            );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getWidth(10)),
              child: Text(
                "Best Seller",
                style: TextStyle(
                    fontSize: getFont(25), fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  final controller = HomePageCubit.get(context);

                  return controller.isLoadingBestSellerBook
                      ? const DifferantLoadingBookItem()
                      : controller.bestSellerBooks.isEmpty
                          ? const ErrorShape()
                          : ListView.separated(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              padding: EdgeInsets.all(getWidth(12)),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookDetailsScreen(
                                            book: controller
                                                .bestSellerBooks[index],
                                            categoryType: controller
                                                        .bestSellerBooks[index]
                                                        .volumeInfo
                                                        ?.categories ==
                                                    null
                                                ? "all"
                                                : controller
                                                    .bestSellerBooks[index]
                                                    .volumeInfo
                                                    ?.categories![0], tag:controller
                                                    .bestSellerBooks[index].id! ,),
                                      ));
                                },
                                child: ShowBookInfoItem(
                                  id:controller.bestSellerBooks[index].id! ,
                                    bookImage: controller.bestSellerBooks[index].volumeInfo?.imageLinks == null
                                        ? ""
                                        : controller
                                                .bestSellerBooks[index]
                                                .volumeInfo
                                                ?.imageLinks!
                                                .thumbnail ??
                                            "",
                                    bookTitle: controller.bestSellerBooks[index]
                                            .volumeInfo?.title ??
                                        "Title",
                                    bookAuther: controller.bestSellerBooks[index].volumeInfo?.authors == null
                                        ? "Auther Not Detect"
                                        : controller.bestSellerBooks[index]
                                            .volumeInfo?.authors![0],
                                    bookPrice: controller.bestSellerBooks[index]
                                                .saleInfo!.saleability ==
                                            "FOR_SALE"
                                        ? "${controller.bestSellerBooks[index].saleInfo!.listPrice?.amount.toString() ?? "Not Detect"} \$"
                                        : "Free",
                                    bookRate: (controller.bestSellerBooks[index].volumeInfo?.averageRating ?? 0).toString(),
                                    bookViewer: (controller.bestSellerBooks[index].volumeInfo?.ratingsCount.toString() ?? "0")),
                              ),
                              itemCount: 5,
                              separatorBuilder: (context, index) => SizedBox(
                                height: getHeight(15),
                              ),
                            );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
