import 'package:flutter/material.dart';
import 'package:movie_app/api/fetch_discover.dart';
import 'package:movie_app/api/fetch_in_theatres.dart';
import 'package:movie_app/api/fetch_top_rated.dart';
import 'package:movie_app/api/fetch_upcoming.dart';
import 'package:movie_app/components/headers/header_home.dart';
import 'package:movie_app/components/sections/section_horizontal.dart';
import 'package:movie_app/components/sections/section_vertical.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// State to store fetched data from API
  List<Map<String, dynamic>> moviesInTheatres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
          child: Column(
            children: [
              // * Header
              const HomeHeader(),

              // * Scrollable Content
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [

                    // * `In Theatre` Section
                    HorizontalSection(
                      title: "In Theatres",
                      fetchFunction: fetchMoviesInTheatres
                    ),

                    // * `Upcoming` Section
                    HorizontalSection(
                      title: "Upcoming",
                      fetchFunction: fetchUpcomingMovies
                    ),

                    // * `Top Rated` Section
                    HorizontalSection(
                      title: "Top Rated",
                      fetchFunction: fetchTopRatedMovies
                    ),

                    // * `Discover` Section
                    VerticalSection(
                      title: "Discover",
                      fetchFunction: fetchPopularMovies
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
