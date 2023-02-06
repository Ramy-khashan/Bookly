import 'package:bookly/core/utils/app_string.dart';
import 'package:bookly/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/error_shape.dart';
import '../../controller/book_details_cubit.dart';
import '../book_details_screen.dart';

class BookYouLikeItem extends StatelessWidget {
  const BookYouLikeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: getHeight(5), horizontal: getWidth(10)),
            child: Text(
              AppString.canAlsoLike,
              style:
                  TextStyle(fontSize: getFont(25), fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(
          height: getHeight(205),
          child: BlocBuilder<BookDetailsCubit, BookDetailsState>(
            builder: (context, state) {
              final controller = BookDetailsCubit.get(context);
              return controller.isCrashedSimillerBooks
                  ? const ErrorShape()
                  : ListView.separated(
                      padding: EdgeInsets.all(getWidth(12)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => controller
                              .isLoadingSmillerBooks
                          ? Shimmer.fromColors(
                              baseColor:
                                  const Color.fromARGB(255, 188, 182, 182),
                              highlightColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              child: Container(
                                width: getWidth(140),
                                height: getHeight(190),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.withOpacity(.9),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookDetailsScreen(
                                          tag: controller
                                              .smillerBooks[index].id!,
                                          book: controller.smillerBooks[index],
                                          categoryType: controller
                                                      .smillerBooks[index]
                                                      .volumeInfo
                                                      ?.categories ==
                                                  null
                                              ? "all"
                                              : controller.smillerBooks[index]
                                                  .volumeInfo?.categories![0]),
                                    ));
                              },
                              child: Hero(
                                tag: controller.smillerBooks[index].id!,
                                child: CustomNetworkImage(
                                    imageUrl: controller.smillerBooks[index]
                                                .volumeInfo?.imageLinks ==
                                            null
                                        ? ""
                                        : controller
                                                .smillerBooks[index]
                                                .volumeInfo
                                                ?.imageLinks!
                                                .thumbnail ??
                                            "",
                                    width: 140,
                                    height: 190,
                                    radius: 15),
                              ),
                            ),
                      itemCount: controller.isLoadingSmillerBooks
                          ? 4
                          : controller.smillerBooks.length,
                      separatorBuilder: (context, index) => SizedBox(
                        width: getWidth(12),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
