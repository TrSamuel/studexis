import 'package:flutter/material.dart';
import 'package:studdataapp/presentation/pages/search/widgets/app_bar.dart';
import 'package:studdataapp/presentation/pages/search/widgets/gridview_search/gridview_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarSearch(context),
      body: const GridviewSearch(),
    );
  }
}
