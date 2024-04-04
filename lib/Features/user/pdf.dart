import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfView extends StatelessWidget {
  const PdfView({super.key, required this.bookUrl});
  final String bookUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PDF(
        pageSnap: false,
      ).cachedFromUrl(
        bookUrl,
        placeholder: (progress) => Center(
            child: Text(
          '$progress %',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        )),
        errorWidget: (error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
