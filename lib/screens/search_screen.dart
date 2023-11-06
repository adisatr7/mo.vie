import 'package:flutter/material.dart';
import 'package:movie_app/api/search_movies.dart';
import 'package:movie_app/components/card/movie_list_card.dart';
import 'package:movie_app/components/headers/header_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchKeyword = "";

  void setSearchKeyword(String keyword) {
    setState(() {
      searchKeyword = keyword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // * Search Header
            SearchHeader(
              searchKeyword: searchKeyword,
              setSearchKeyword: setSearchKeyword
            ),

            // * Empty space
            const SizedBox(height: 12),

            // * Search Result
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Visibility(
                  visible: searchKeyword.isNotEmpty,
                  child: FutureBuilder(
                    future: searchMovies(searchKeyword),
                    builder: (context, snapshot) {

                      // * On error
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            "Error while fetching data",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        );
                      }

                      // * On loading
                      else if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }

                      // * On success
                      else if (snapshot.hasData) {
                        final movies = snapshot.data!["results"];

                        return ListView.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index) => MovieListCard(
                            item: movies[index],
                          ),
                        );
                      }

                      // * On not found
                      else {
                        return const Center(
                          child: Text(
                            "No movies found",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        );
                      }
                    },
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}