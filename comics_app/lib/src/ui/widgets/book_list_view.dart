import 'package:comics_app/src/constants/color.global.dart';
import 'package:flutter/material.dart';

import 'package:comics_app/src/ui/widgets/book_item.dart';

class BookListView extends StatelessWidget {
  const BookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Truyện tranh',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              TextButton(
                  onPressed: () {},
                  child: Text('Tất cả >',
                      style: TextStyle(
                          color: GlobalColors.orangeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)))
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 10; i++)
                  Row(
                    children: [BookItem(), SizedBox(width: 10)],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
