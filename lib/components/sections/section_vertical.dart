import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../card/movie_list_card.dart';


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
                  itemBuilder: (context, index) => MovieListCard(item: results[index]),
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
