import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/buttons/back.dart';


class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final String posterPath = item["poster_path"] != null
      ? "https://image.tmdb.org/t/p/w400${item["poster_path"]}"
      : "https://www.solidbackgrounds.com/images/2560x1440/2560x1440-gray-solid-color-background.jpg";

    return Scaffold(
      body: Stack(
        children: [

          Column(
            children: [

              // * Background image
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Image.network(
                  posterPath,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                ),
              ),

              // Container(
              //   height: MediaQuery.of(context).size.height / 2,
              // ),

              Container(
                color: const Color.fromRGBO(21, 22, 22, 1),
                height: MediaQuery.of(context).size.height / 2,
              ),

            ],
          ),

          // * Main Content
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [

              // * Empty space
              const SizedBox(
                height: 200,
              ),

              // * Main Content
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Container(
                  color: const Color.fromRGBO(21, 22, 22, 1.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [

                      Container(
                        margin: const EdgeInsets.only(top: 14, bottom: 16),
                        child: Row(
                          children: [

                            // * Movie poster
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                posterPath,
                                fit: BoxFit.cover,
                                height: 76,
                                width: 76,
                              ),
                            ),

                            // * Movie title
                            Container(
                              margin: const EdgeInsets.only(left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(item["title"],
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),

                                  // * Movie release date
                                  Text(
                                    DateFormat("MMMM d, yyyy").format(DateTime.parse(item["release_date"])),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    )
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // * Left aligned content
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          // * Movie overview
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text("Description:",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(top: 4, bottom: 12),
                                child: Text(item["overview"],
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),

                    ],
                  )
                ),
              )

            ],
          ),

          // * Back button
          const Back(),
        ],
      ),
    );
  }
}