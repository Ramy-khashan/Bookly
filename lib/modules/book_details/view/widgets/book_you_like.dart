import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/custom_network_image.dart';
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
      mainAxisSize: MainAxisSize.min,
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
        BlocBuilder<BookDetailsCubit, BookDetailsState>(
          builder: (context, state) {
            final controller = BookDetailsCubit.get(context);
            return controller.isCrashedSimillerBooks
                ? const ErrorShape()
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            mainAxisExtent: 220,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 17,
                            mainAxisSpacing: 20),
                    padding: EdgeInsets.all(getWidth(12)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => controller
                            .isLoadingSmillerBooks
                        ? Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 188, 182, 182),
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
                                        tag: controller.smillerBooks[index].id!,
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
                            child: ClipRRect(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(10),
                              child: GridTile(
                                footer: GridTileBar(
                                  title: Text(
                                    controller
                                        .smillerBooks[index].volumeInfo!.title??"",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: getFont(22),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    // controller.smillerBooks[index].volumeInfo!
                                    //     .authors!.first??"",
                                         controller.smillerBooks[index].volumeInfo?.authors == null
                                        ? "Auther Not Detect"
                                        : controller.smillerBooks[index]
                                            .volumeInfo?.authors![0],
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: getFont(20),
                                    ),
                                  ),
                                  backgroundColor:
                                      AppColors.primaryColor.withOpacity(.7),
                                ),
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
                                      radius: 10),
                                ),
                              ),
                            ),
                          ),
                    itemCount: controller.isLoadingSmillerBooks
                        ? 4
                        : controller.smillerBooks.length,
                  );
          },
        ),
      ],
    );
  }
}
