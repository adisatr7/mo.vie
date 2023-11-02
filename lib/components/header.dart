import 'package:flutter/material.dart';


class PageHeader extends StatelessWidget {
  final String _title;
  const PageHeader({Key? key, String title = ""}) : _title = title, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        // * Back button
        IconButton(
          color: Colors.white,
          icon: const Icon(
            Icons.chevron_left_rounded
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        // * Optional title label
        Visibility(
          visible: _title != "",
          child: Expanded(
            child: Text(_title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }
}