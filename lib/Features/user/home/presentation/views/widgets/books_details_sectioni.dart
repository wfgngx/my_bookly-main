import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../pdf.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection(
      {super.key,
      required this.authorName,
      required this.bookName,
      required this.aboutAuthor,
      required this.bookDescription,
      required this.coverImage,
      required this.bookPdf});
  final String authorName;
  final String bookName;
  final String bookDescription;
  final String aboutAuthor;
  final String coverImage;
  final String bookPdf;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2.w,
          ),
          child: CustomBookImage(
            imageUrl: coverImage,
          ),
        ),
        SizedBox(
          height: 43.h,
        ),
        Text(
          bookName,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 12.h,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            "المؤلف : $authorName",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookDescription,
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Divider(
          height: 1.h,
          thickness: 1.h,
          endIndent: 30.w,
          indent: 30.w,
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 37.h,
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PdfView(bookUrl: bookPdf),
              )),
          child: Container(
            width: 80.w,
            height: 35.h,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8.r)),
            child: Center(
              child: Text(
                "Read",
                style: Styles.textStyle20
                    .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 37.h,
        ),
      ],
    );
  }
}
