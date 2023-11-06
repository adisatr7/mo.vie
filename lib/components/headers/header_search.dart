import 'package:flutter/material.dart';


class SearchHeader extends StatefulWidget {
  final String searchKeyword;
  final Function setSearchKeyword;

  const SearchHeader({
    Key? key,
    required this.searchKeyword,
    required this.setSearchKeyword
  }) : super(key: key);

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // * Back button
          IconButton(
            color: Colors.white,
            iconSize: 24,
            icon: const Icon(Icons.chevron_left_rounded),
            onPressed: () => Navigator.pop(context)
          ),

          // * Search Bar
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: TextField(
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.4
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: const Color.fromRGBO(38, 38, 38, 1),
                    hintText: "Search for movie titles...",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 255, 255, 0.5)
                    ),
                    // prefixIcon: Icon(Icons.search_rounded),
                    // prefixIconColor: Color.fromRGBO(255, 255, 255, 0.5),
                    suffixIconColor: Color.fromRGBO(255, 255, 255, widget.searchKeyword == "" ? 0 : 0.5),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear_rounded),
                      splashColor: Colors.transparent,
                      onPressed: () {
                        widget.setSearchKeyword("");
                      },
                    ),
                  ),
                  controller: _searchController,
                  onChanged: (value) {
                    widget.setSearchKeyword(value);
                  },
                ),
              ),
            ),
          ),
          // const Icon(Icons.search_rounded, color: Colors.white)
        ],
      ),
    );
  }
}