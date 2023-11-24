import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/screens/detail_screen.dart';


class MovieTileCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const MovieTileCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime releaseDate = DateTime.parse(item["release_date"]);

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
        width: 145,
        margin: const EdgeInsets.only(right: 10),
        child: Expanded(
          child: Column(
            key: Key(item["id"].toString()),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // * Thumbnail image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item["poster_path"] != null
                    ? "https://image.tmdb.org/t/p/w400${item["poster_path"]}"
                    : "https://www.solidbackgrounds.com/images/2560x1440/2560x1440-gray-solid-color-background.jpg",
                  height: 105,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),

              // * Text container
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // * Movie Title
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    child: Text(
                      item["title"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
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

            ],
          ),
        ),
      ),
    );
  }
}
