import 'package:flutter/material.dart';
import '../screens/search_screen.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key, String title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // * App Title
          Text(
            'Mo.vie',
            style: TextStyle(
              fontSize: 26,
              fontFamily: "Rockwell",
              color: Theme.of(context).primaryColor),
          ),

          // * Search Button
          IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
              color: Color(Colors.white.value),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
