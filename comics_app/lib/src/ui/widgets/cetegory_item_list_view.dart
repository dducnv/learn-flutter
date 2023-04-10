import 'dart:convert';

import 'package:comics_app/src/constants/color.global.dart';
import 'package:comics_app/src/models/book.dart';
import 'package:comics_app/src/models/category.dart';
import 'package:flutter/material.dart';

import 'package:comics_app/src/ui/widgets/book_item.dart';

class CategoryItemListView extends StatelessWidget {
  CategoryModel? categoryModel;
  CategoryItemListView({Key? key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<BookModel> books = categoryModel!.data!.map((e) {
      return BookModel.fromJson(e);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${categoryModel!.title}',
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
          SizedBox(
            height: 220,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    BookItem(bookModel: books[index]),
                    SizedBox(
                      width: 10,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
