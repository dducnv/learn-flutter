import 'package:comics_app/src/constants/color.global.dart';
import 'package:comics_app/src/models/book.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  BookModel? bookModel;

  BookItem({required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              '${bookModel!.imgUrl}',
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text( '${bookModel!.bookName}',
           overflow: TextOverflow.ellipsis,
               maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
              gradient:  GlobalColors.categoryBgGradient ,
              borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Text('${bookModel!.categoryList}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}
