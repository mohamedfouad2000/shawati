import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchScreenBody(),
    );
  }
}
