import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/book_web_view_cubit.dart';

class BookWebViewScreen extends StatelessWidget {
  const BookWebViewScreen(
      {super.key, required this.title, required this.bookUrl});
  final String title;
  final String bookUrl;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookWebViewCubit()..initialWebView(bookUrl),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              title,
              style: const TextStyle(fontSize: 22),
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<BookWebViewCubit, BookWebViewState>(
            builder: (context, state) {
              return WebViewWidget(
                  controller:
                      BlocProvider.of<BookWebViewCubit>(context).controller!);
            },
          )),
    );
  }
}
