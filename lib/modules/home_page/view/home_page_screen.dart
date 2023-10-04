import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/size_config.dart';
import '../controller/home_page_cubit.dart';
import '../../../core/widgets/differant_loading_book_item.dart';
import '../../../core/widgets/show_book_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../../core/widgets/error_shape.dart';
import '../../book_details/view/book_details_screen.dart';
import '../../search/view/search_screen.dart';

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
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'BOOKLY',
                        textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "head"),
                        speed: const Duration(milliseconds: 500),
                      ),
                    ],
                    repeatForever: true,
                    pause: const Duration(milliseconds: 300),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
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
            Center(
              child: SizedBox(
                height: getHeight(250),
                child: BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (context, state) {
                    final controller = HomePageCubit.get(context);

                    return controller.isLoadingNewBook
                        ? Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 188, 182, 182),
                            highlightColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            child: Container(
                              width: getWidth(350.0),
                              height: getHeight(400),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.withOpacity(.9),
                              ),
                            ),
                          )
                        : controller.newBooks.isEmpty
                            ? const ErrorShape()
                            : Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BookDetailsScreen(
                                                    tag: controller
                                                            .newBooks[index]
                                                            .id! +
                                                        index.toString(),
                                                    book:
                                                        controller
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
                                    child: Hero(
                                      tag: controller.newBooks[index].id!,
                                      child: CustomNetworkImage(
                                        radius: 15,
                                        height: 250,
                                        width: 135,
                                        imageUrl: controller.newBooks[index]
                                                    .volumeInfo?.imageLinks ==
                                                null
                                            ? ""
                                            : controller
                                                    .newBooks[index]
                                                    .volumeInfo
                                                    ?.imageLinks!
                                                    .thumbnail ??
                                                "",
                                      ),
                                    ),
                                  );
                                },
                                itemCount: controller.newBooks.length,
                                itemWidth: getWidth(320.0),
                                curve: Curves.easeInQuad,
                                itemHeight: getHeight(400),
                                duration: 300,
                                physics: const BouncingScrollPhysics(),
                                layout: SwiperLayout.STACK,
                              );
                  },
                ),
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
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 250,
                                      mainAxisExtent: 220,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 17,
                                      mainAxisSpacing: 20),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              padding: EdgeInsets.all(getWidth(12)),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookDetailsScreen(
                                          book:
                                              controller.bestSellerBooks[index],
                                          categoryType: controller
                                                      .bestSellerBooks[index]
                                                      .volumeInfo
                                                      ?.categories ==
                                                  null
                                              ? "all"
                                              : controller
                                                  .bestSellerBooks[index]
                                                  .volumeInfo
                                                  ?.categories![0],
                                          tag: controller
                                              .bestSellerBooks[index].id!,
                                        ),
                                      ));
                                },
                                child: ShowBookInfoItem(
                                    id: controller.bestSellerBooks[index].id!,
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
                              itemCount: controller.bestSellerBooks.length,
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
