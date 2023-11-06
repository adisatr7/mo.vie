import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class VerticalSection extends StatefulWidget {
  // final List<Map<String, dynamic>> items;
  final Future<Map<String, dynamic>> Function() fetchFunction;
  final String title;

  const VerticalSection({
    super.key,
    required this.title,
    required this.fetchFunction
  });

  @override
  State<VerticalSection> createState() => _VerticalSectionState();
}

class _VerticalSectionState extends State<VerticalSection> {
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

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final DateTime releaseDate = DateTime.parse(results[index]["release_date"]);

                    // * The item card
                    return Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: Row(
                        key: Key(index.toString()),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // * Movie Poster
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w400${results[index]["poster_path"]}",
                              height: 105,
                              width: 140,
                              fit: BoxFit.cover
                            ),
                          ),

                          // * Movie Title and Release Date container
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 14),
                            height: 105,
                            width: 236,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // * Movie Title
                                Text(
                                  results[index]["title"],
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

                  },
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
