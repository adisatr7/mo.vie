import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MovieListCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const MovieListCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime releaseDate = DateTime.parse(item["release_date"]);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        key: Key(item["id"].toString()),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // * Movie Poster
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://image.tmdb.org/t/p/w400${item["poster_path"]}",
              height: 64,
              width: 114,
              fit: BoxFit.cover
            ),
          ),

          // * Movie Title and Release Date container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            height: 64,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // * Movie Title
                Text(
                  item["title"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // * Movie Release Date
                Text(
                  DateFormat("MMM d, yyyy").format(releaseDate),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
