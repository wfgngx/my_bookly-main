import 'package:bookly/Features/user/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView(
      {super.key,
      required this.authorName,
      required this.bookName,
      required this.bookDescription,
      required this.aboutAuthor,
      required this.coverImage,
      required this.coverPdf});

  final String authorName;

  final String bookName;

  final String bookDescription;

  final String aboutAuthor;

  final String coverImage;

  final String coverPdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        title: const Text("Book Details"),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: BookDetailsViewBody(
            authorName: authorName,
            bookName: bookName,
            coverImage: coverImage,
            aboutAuthor: aboutAuthor,
            bookDescription: bookDescription,
            coverPdf: coverPdf,
          ),
        ),
      ),
    );
  }
}
