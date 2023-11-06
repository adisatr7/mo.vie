import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/components/card/movie_tile_card.dart';
import 'package:movie_app/models/movie.dart';


class HorizontalSection extends StatefulWidget {
  // final List<Map<String, dynamic>> items;
  final Future<Map<String, dynamic>> Function() fetchFunction;
  final String title;

  const HorizontalSection({
    super.key,
    required this.title,
    required this.fetchFunction
  });

  @override
  State<HorizontalSection> createState() => _HorizontalSectionState();
}

class _HorizontalSectionState extends State<HorizontalSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22
          ),
        ),
        const Divider(
          color: Color.fromRGBO(244, 212, 43, 1),
          thickness: 1,
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          child: FutureBuilder(
            future: widget.fetchFunction(),
            builder: (context, snapshot) {
              // Is loading
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // On success
              else if (snapshot.hasData) {
                final results = snapshot.data!["results"];

                return SizedBox(
                  height: 160,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: results.length,
                    itemBuilder: (context, index) =>
                        MovieTileCard(item: results[index]),
                  ),
                );
              }

              // On error
              else {
                throw Exception("Failed to load data");
              }
            },
          ),
        ),
      ],
    );
  }
}
