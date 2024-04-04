// import 'package:bookly/Features/user/home/presentation/views/widgets/custom_book_item.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../../../../core/utils/constants.dart';
// import '../../../../../core/utils/strings.dart';
// import '../../../../../core/utils/styles.dart';
// import '../../../pdf.dart';
// import '../../../search/presentation/views/search_view.dart';
// import 'book_details.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   bool gridView = true;
//   Future<void> _showAlertDialog(BuildContext context) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Logout'),
//           content: const SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('Are you sure, doy you want to logout?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text(
//                 'Yes',
//               ),
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.signOut();
//                   Navigator.pushReplacementNamed(context, loginScreen);
//                 } catch (error) {
//                   ScaffoldMessenger.of(context).clearSnackBars();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Authentication Failed')),
//                   );
//                 }
//                 // Close the dialog
//               },
//             ),
//             TextButton(
//               child: const Text(
//                 'No',
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: kPrimaryColor,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title: Text(
//             "MAKTABTY",
//             style: Styles.textStyle14.copyWith(
//                 fontStyle: FontStyle.italic,
//                 fontWeight: FontWeight.w800,
//                 letterSpacing: 4,
//                 fontSize: 22,
//                 color: const Color(0xfffbf4ea)),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     gridView = !gridView;
//                   });
//                 },
//                 icon: Icon(gridView ? Icons.list : Icons.grid_view_rounded)),
//             IconButton(
//               color: Colors.white,
//               onPressed: () async {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const SearchView(),
//                     ));
//               },
//               icon: const Icon(
//                 Icons.search,
//               ),
//             ),
//             IconButton(
//               color: Colors.white,
//               onPressed: () async {
//                 _showAlertDialog(context);
//               },
//               icon: const Icon(
//                 Icons.logout,
//               ),
//             ),
//           ],
//         ),
//         body: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection('books').snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (!snapshot.hasData) {
//                 return const CircularProgressIndicator(); // Display loading indicator
//               }
//               return gridView
//                   ? Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: GridView(
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisSpacing: 10,
//                                 mainAxisSpacing: 8,
//                                 childAspectRatio: 0.7,
//                                 crossAxisCount: 2),
//                         children: snapshot.data!.docs
//                             .map((DocumentSnapshot document) {
//                           Map<String, dynamic> data =
//                               document.data() as Map<String, dynamic>;
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => BookDetailsView(
//                                           authorName: data['authorName'],
//                                           bookName: data['bookName'],
//                                           bookDescription:
//                                               data['bookDescription'],
//                                           aboutAuthor: '0',
//                                           coverImage: data['bookCover'],
//                                           coverPdf: data['bookPdf'])
//                                       ));
//                             },
//                             child: CustomBookImage(imageUrl: data['bookCover']),
//                           );
//                         }).toList(),
//                       ),
//                     )
//                   : Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: ListView(
//                         children: snapshot.data!.docs
//                             .map((DocumentSnapshot document) {
//                           Map<String, dynamic> data =
//                               document.data() as Map<String, dynamic>;
//                           return Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   height: 200,
//                                   child: Row(
//                                     children: [
//                                       CustomBookImage(
//                                           imageUrl: data['bookCover']),
//                                       const SizedBox(
//                                         width: 16,
//                                       ),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .5,
//                                               child: Text(
//                                                 "${data['bookName']}",
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style:
//                                                     Styles.textStyle30.copyWith(
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               height: 4,
//                                             ),
//                                             Opacity(
//                                                 opacity: .7,
//                                                 child: Row(
//                                                   children: [
//                                                     Text(
//                                                       data['authorName'],
//                                                       style: Styles.textStyle18
//                                                           .copyWith(
//                                                         fontStyle:
//                                                             FontStyle.italic,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 )),
//                                             const SizedBox(
//                                               height: 4,
//                                             ),
//                                             Opacity(
//                                               opacity: .7,
//                                               child: Text(
//                                                 data['bookDescription'] ?? '',
//                                                 maxLines: 5,
//                                                 style: Styles.textStyle20.copyWith(
//                                                     fontSize: 12,
//                                                     overflow:
//                                                         TextOverflow.ellipsis
//                                                     ),
//                                               ),
//                                             ),
//                                             const Spacer(),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               PdfView(
//                                                                   bookUrl: data[
//                                                                       'bookPdf']),
//                                                         ));
//                                                   },
//                                                   child: Container(
//                                                     width: 80,
//                                                     height: 35,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.red,
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8)),
//                                                     child: const Center(
//                                                       child: Icon(
//                                                         size: 32,
//                                                         Icons.menu_book_sharp,
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             const SizedBox(
//                                               height: 12,
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 12,
//                                 ),
//                                 const Divider(
//                                   endIndent: 30,
//                                   indent: 30,
//                                   thickness: 1,
//                                   height: 1,
//                                   color: Colors.white,
//                                 )
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     );
//
//             },
//           ),
//         ));
//   }
// }
import 'package:bookly/Features/user/home/presentation/views/widgets/custom_book_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/utils/styles.dart';
import '../../../pdf.dart';
import '../../../search/presentation/views/search_view.dart';
import 'book_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "MAKTABTY",
          style: Styles.textStyle14.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
            letterSpacing: 4.w,
            fontSize: 22.sp,
            color: const Color(0xfffbf4ea),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                gridView = !gridView;
              });
            },
            icon: Icon(gridView ? Icons.list : Icons.grid_view_rounded),
          ),
          _buildIconButton(
            icon: Icons.search,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
          ),
          _buildIconButton(
            icon: Icons.logout,
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      color: Colors.white,
      onPressed: onPressed,
      icon: Icon(
        icon,
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure, do you want to logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, loginScreen);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Authentication Failed')),
                  );
                }
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('books').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No books available'));
          } else {
            return gridView
                ? _buildGridView(snapshot.data!.docs)
                : _buildListView(snapshot.data!.docs);
          }
        },
      ),
    );
  }

  Widget _buildGridView(List<QueryDocumentSnapshot> docs) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 0.7.r,
          crossAxisCount: 2,
        ),
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> data =
              docs[index].data() as Map<String, dynamic>;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsView(
                    authorName: data['authorName'],
                    bookName: data['bookName'],
                    bookDescription: data['bookDescription'],
                    aboutAuthor: '0',
                    coverImage: data['bookCover'],
                    coverPdf: data['bookPdf'],
                  ),
                ),
              );
            },
            child: CustomBookImage(imageUrl: data['bookCover']),
          );
        },
      ),
    );
  }

  Widget _buildListView(List<QueryDocumentSnapshot> docs) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> data =
              docs[index].data() as Map<String, dynamic>;
          return _buildListItem(context, data);
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
            height: 1.h,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildBookItem(BuildContext context, Map<String, dynamic> data) {
    return SizedBox(
      height: 200.h,
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
        const Spacer(),
        _buildReadButton(context, data['bookPdf']),
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

  Widget _buildReadButton(BuildContext context, String bookPdfUrl) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfView(bookUrl: bookPdfUrl),
        ),
      ),
      child: Container(
        width: 80.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Icon(
            Icons.menu_book_sharp,
            size: 32.r,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
