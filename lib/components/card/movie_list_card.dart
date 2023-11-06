import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../screens/detail_screen.dart';


class MovieListCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const MovieListCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic releaseDate = item["release_date"] != "" ? DateTime.parse(item["release_date"]) : "";

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(item: item)
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        child: Row(
          key: Key(item["id"].toString()),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // * Movie Poster
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item["poster_path"] != null
                  ? "https://image.tmdb.org/t/p/w400${item["poster_path"]}"
                  : "https://www.solidbackgrounds.com/images/2560x1440/2560x1440-gray-solid-color-background.jpg",
                height: 64,
                width: 114,
                fit: BoxFit.cover
              ),
            ),

            // * Movie Title and Release Date container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              height: 64,
              width: 220,
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
                    releaseDate != "" ? DateFormat("MMM d, yyyy").format(releaseDate) : "Unavailable",
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
      ),
    );
  }
}
