import 'package:flutter/material.dart';


class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: IconButton(
                  color: Colors.white,
                  iconSize: 34,
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}