import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


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
                    itemBuilder: (context, index) {
                      final DateTime releaseDate = DateTime.parse(results[index]["release_date"]);

                      return Container(
                        width: 145,
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          key: Key(index.toString()),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w400${results[index]["poster_path"]}",
                                height: 105,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    results[index]["title"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
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
                      );
                    },
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
