 import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/error_shape.dart';
import 'model_sheet_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/function/url_lancher_functions.dart';
import '../../../../core/utils/size_config.dart';
import '../../controller/book_details_cubit.dart';
 
class BookDetailsItem extends StatelessWidget {
  final String tag;
  const BookDetailsItem({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        final controller = BookDetailsCubit.get(context);
        return controller.bookDdetails == null
            ? SizedBox(height: getHeight(350), child: const ErrorShape())
            : Column(
             
                children: [
                  SizedBox(
                    height: getHeight(6),
                  ),
                  Hero(
                    tag: tag,
                    child: CustomNetworkImage(
                        imageUrl:
                            controller.bookDdetails!.volumeInfo?.imageLinks ==
                                    null
                                ? ""
                                : controller.bookDdetails!.volumeInfo
                                        ?.imageLinks!.thumbnail ??
                                    "",
                        width: 160,
                        height: 230,
                        radius: 15),
                  ),
                  SizedBox(
                    height: getHeight(14),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectableText(
                      controller.bookDdetails!.volumeInfo?.title ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                            fontFamily: "title",

                          fontSize: getFont(30),
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(4),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            controller.bookDdetails!.volumeInfo?.authors == null
                                ? "Auther Not Detect"
                                : controller
                                    .bookDdetails!.volumeInfo?.authors![0],
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontFamily: "title",
                                fontSize: getFont(25),
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showSheet(
                                  context: context,
                                  description:
                                      "${controller.bookDdetails!.volumeInfo?.description}"
                                          .replaceAll('<p>', '\n')
                                          .replaceAll('<br>', ' ')
                                          .replaceAll('...', '')
                                          .replaceAll('.', '.\n')
                                          .replaceAll("</p>", "\n"),
                                  isEnglish: controller
                                          .bookDdetails!.volumeInfo!.language ==
                                      "en");
                            },
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: getFont(20),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getHeight(7),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Icon(
                  //       Icons.star_outlined,
                  //       color: Colors.amber.shade600,
                  //     ),
                  //     Text(
                  //       controller.bookDdetails?.volumeInfo?.averageRating
                  //                   .toString() ==
                  //               "null"
                  //           ? "0"
                  //           : "${controller.bookDdetails?.volumeInfo?.averageRating}",
                  //       style: TextStyle(
                  //           fontSize: getFont(22),
                  //           fontWeight: FontWeight.bold,
                  //           color: AppColors.textColor),
                  //     ),
                  //     SizedBox(
                  //       width: getWidth(8),
                  //     ),
                  //     Text(
                  //       controller.bookDdetails?.volumeInfo?.ratingsCount
                  //                   .toString() ==
                  //               "null"
                  //           ? "(0)"
                  //           : "(${controller.bookDdetails?.volumeInfo?.ratingsCount.toString()})",
                  //       style: TextStyle(
                  //           fontSize: getFont(20),
                  //           fontWeight: FontWeight.w600,
                  //           color: AppColors.textColor),
                  //     )
                  //   ],
                  // ),
             
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: getHeight(15),
                  //     bottom: getHeight(7),
                  //   ),
                  //   child: BookBbuttonActionItem(
                  //     onTapReview: () {
                  //       launchURL(
                  //           url: controller
                  //                   .bookDdetails?.volumeInfo?.previewLink!
                  //                   .replaceFirst('http', 'https') ??
                  //               "");
                  //     },
                  //     bookPrice: controller
                  //                 .bookDdetails!.saleInfo!.saleability ==
                  //             "FOR_SALE"
                  //         ? "${controller.bookDdetails!.saleInfo!.listPrice?.amount.toString() ?? "Not Detect"} \$"
                  //         : "Free",
                  //   ),
                  // ),
                  ElevatedButton(
                      onPressed: () {
                        launchURL(
                            url: controller
                                    .bookDdetails?.volumeInfo?.previewLink!
                                    .replaceFirst('http', 'https') ??
                                "");
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                          backgroundColor: AppColors.primaryColor),
                      child: const Text(
                        "Preview Book!",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "title",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                      const SizedBox(height: 12,)
                  // controller.bookDdetails?.accessInfo?.pdf?.isAvailable ==
                  //             false ||
                  //         controller.bookDdetails?.accessInfo?.pdf
                  //                 ?.acsTokenLink ==
                  //             null
                  //     ? Text(
                  //         AppString.noDownload,
                  //         style: TextStyle(
                  //             color: Colors.red,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: getFont(19)),
                  //       )
                  //     : ElevatedButton(
                  //         onPressed: () {
                  //           print(controller
                  //               .bookDdetails?.accessInfo?.pdf?.acsTokenLink
                  //               .toString());
                  //           launchURL(
                  //               url: controller.bookDdetails?.accessInfo?.pdf
                  //                       ?.acsTokenLink!
                  //                       .replaceFirst('http', 'https') ??
                  //                   'https://google.com');
                  //         },
                  //         child: const Text("Download Pdf"))
                ],
              );
      },
    );
  }
}
