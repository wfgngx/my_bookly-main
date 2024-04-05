// import 'package:bookly/Features/user/home/presentation/views/book_details.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../../../../../../core/utils/styles.dart';
// import '../../../../home/presentation/views/widgets/custom_book_item.dart';
// import 'custom_search_text_field.dart';
//
// class SearchViewBody extends StatefulWidget {
//   SearchViewBody({super.key, required this.allBooks});
//   final List allBooks;
//   List searchBooks = [];
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   State<SearchViewBody> createState() => _SearchViewBodyState();
// }
//
// class _SearchViewBodyState extends State<SearchViewBody> {
//   @override
//   Widget build(BuildContext context) {
//     print(widget.allBooks);
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: widget._controller,
//               onChanged: (value) {
//                 setState(() {
//                   addSearchedForItemsToSearchedList(value);
//                   print(widget.searchBooks);
//                 });
//               },
//               decoration: InputDecoration(
//                 enabledBorder: buildOutlineInputBorder(),
//                 focusedBorder: buildOutlineInputBorder(),
//                 hintText: 'Search',
//                 suffixIcon: IconButton(
//                   onPressed: () {},
//                   icon: const Opacity(
//                     opacity: .8,
//                     child: Icon(
//                       FontAwesomeIcons.magnifyingGlass,
//                       size: 22,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             const Text(
//               'Search Result',
//               style: Styles.textStyle18,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemCount: widget.searchBooks.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => BookDetailsView(
//                                     authorName: widget.searchBooks[index]['authorName'],
//                                     bookName: widget.searchBooks[index]['bookName'],
//                                     bookDescription: widget.searchBooks[index]
//                                         ['bookDescription'],
//                                     aboutAuthor: widget.searchBooks[index][''],
//                                     coverImage: widget.searchBooks[index]['bookCover'],
//                                     coverPdf: widget.searchBooks[index]['']),
//                               ));
//                         },
//                         child:
//                             _buildListItem(context, widget.searchBooks[index])),
//                     // child: Text(widget.searchBooks[index]['bookName']),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget _buildListItem(BuildContext context, Map<String, dynamic> data) {
//   //   return Padding(
//   //     padding: EdgeInsets.all(12.h),
//   //     child: Column(
//   //       children: [
//   //         _buildBookItem(context, data),
//   //         SizedBox(height: 12.h),
//   //         Divider(
//   //           endIndent: 30.w,
//   //           indent: 30.w,
//   //           thickness: 1.h,
//   //           height: 1.h,
//   //           color: Colors.white,
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildBookItem(BuildContext context, Map<String, dynamic> data) {
//     return SizedBox(
//       height: 100,
//       child: Row(
//         children: [
//           CustomBookImage(imageUrl: data['bookCover']),
//           SizedBox(width: 16.w),
//           Expanded(child: _buildBookDetails(context, data)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBookDetails(BuildContext context, Map<String, dynamic> data) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildBookName(context, data['bookName']),
//         SizedBox(height: 4.h),
//         _buildAuthorName(data['authorName']),
//         SizedBox(height: 4.h),
//         _buildBookDescription(data['bookDescription']),
//       ],
//     );
//   }
//
//   Widget _buildBookName(BuildContext context, String bookName) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * .5.w,
//       child: Text(
//         bookName,
//         maxLines: 1,
//         overflow: TextOverflow.ellipsis,
//         style: Styles.textStyle30
//             .copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
//       ),
//     );
//   }
//
//   Widget _buildAuthorName(String authorName) {
//     return Opacity(
//       opacity: .7,
//       child: Text(
//         authorName,
//         style: Styles.textStyle18.copyWith(
//           fontStyle: FontStyle.italic,
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBookDescription(String? description) {
//     return Opacity(
//       opacity: .7,
//       child: Text(
//         description ?? '',
//         maxLines: 5,
//         style: Styles.textStyle20.copyWith(
//           fontSize: 8.sp,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//     );
//   }
//
//   // void addSearchedForItemsToSearchedList(String searchedBooks) {
//   //   widget.searchBooks = widget.allBooks
//   //       .where((book) => book['bookName']
//   //           .toString()
//   //           .toLowerCase()
//   //           .startsWith(searchedBooks.toLowerCase()))
//   //       .toList();
//   //   setState(() {});
//   //   if (widget._controller.text.isEmpty) {
//   //     setState(() {
//   //       widget.searchBooks.clear();
//   //     });
//   //   }
//   // }
//
//   // OutlineInputBorder buildOutlineInputBorder() {
//   //   return OutlineInputBorder(
//   //     borderSide: const BorderSide(
//   //       color: Colors.white,
//   //     ),
//   //     borderRadius: BorderRadius.circular(
//   //       12,
//   //     ),
//   //   );
//   // }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bookly/Features/user/home/presentation/views/book_details.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/custom_book_item.dart';

class SearchViewBody extends StatefulWidget {
  final List<Map<String, dynamic>> allBooks;

  const SearchViewBody({
    Key? key,
    required this.allBooks,
  }) : super(key: key);

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> searchBooks = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchTextField(),
            SizedBox(height: 16.h),
            const Text('Search Result', style: Styles.textStyle18),
            SizedBox(height: 16.h),
            _buildSearchResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildBookItem(BuildContext context, Map<String, dynamic> data) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          CustomBookImage(imageUrl: data['bookCover']),
          SizedBox(width: 16.w),
          Expanded(child: _buildBookDetails(context, data)),
        ],
      ),
    );
  }

  Widget _buildBookDetails(BuildContext context, Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBookName(context, data['bookName']),
        SizedBox(height: 4.h),
        _buildAuthorName(data['authorName']),
        SizedBox(height: 4.h),
        _buildBookDescription(data['bookDescription']),
      ],
    );
  }

  Widget _buildBookName(BuildContext context, String bookName) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5.w,
      child: Text(
        bookName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Styles.textStyle30
            .copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
      ),
    );
  }

  Widget _buildAuthorName(String authorName) {
    return Opacity(
      opacity: .7,
      child: Text(
        authorName,
        style: Styles.textStyle18.copyWith(
          fontStyle: FontStyle.italic,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBookDescription(String? description) {
    return Opacity(
      opacity: .7,
      child: Text(
        description ?? '',
        maxLines: 5,
        style: Styles.textStyle20.copyWith(
          fontSize: 8.sp,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _controller,
      onChanged: _handleSearch,
      decoration: InputDecoration(
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Opacity(
            opacity: .8,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: searchBooks.length,
        itemBuilder: (context, index) {
          final book = searchBooks[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailsView(
                  authorName: book['authorName'],
                  bookName: book['bookName'],
                  bookDescription: book['bookDescription'],
                  aboutAuthor: book['aboutAuthor'] ?? '',
                  coverImage: book['bookCover'],
                  coverPdf: book['bookPdf'] ?? '',
                ),
              ),
            ),
            child: _buildListItem(context, book),
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Column(
        children: [
          _buildBookItem(context, data),
          SizedBox(height: 12.h),
          Divider(
            endIndent: 30.w,
            indent: 30.w,
            thickness: 1.h,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  // The methods _buildBookItem, _buildBookDetails, _buildBookName, _buildAuthorName, and _buildBookDescription remain unchanged.

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        searchBooks.clear();
      } else {
        searchBooks = widget.allBooks.where((book) {
          final bookNameLower = book['bookName'].toString().toLowerCase();
          final queryLower = query.toLowerCase();
          return bookNameLower.contains(queryLower);
        }).toList();
      }
    });
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
