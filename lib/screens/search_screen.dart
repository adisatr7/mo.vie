import 'package:flutter/material.dart';
import 'package:movie_app/components/headers/header_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // * Search Header
            const SearchHeader(),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text("Search Result"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}