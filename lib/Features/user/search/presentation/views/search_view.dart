import 'package:bookly/Features/user/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key,required this.allBooks});
  final List<Map<String,dynamic>> allBooks;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SearchViewBody(allBooks: allBooks,),
      ),
    );
  }
}
