import 'package:comics_app/src/constants/color.global.dart';
import 'package:comics_app/src/models/book.dart';
import 'package:flutter/material.dart';

class BookItemRow extends StatelessWidget {
  BookModel? bookModel;
  int? index;
  BookItemRow({Key? key,this.bookModel,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Flexible(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
             '${bookModel!.imgUrl}',
              width: MediaQuery.of(context).size.height * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
              fit: BoxFit.cover,
            ),
          )),
      SizedBox(
          height: 70,
          child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Text('${index}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)))),
      Flexible(
        flex: 2,
        child: Container(
          height: 70,
          padding: EdgeInsets.only(top: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${bookModel!.bookName}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                        gradient: GlobalColors.categoryBgGradient,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Text('${bookModel?.categoryList}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Row(children: [
                  Icon(Icons.favorite, color: Colors.grey, size: 15),
                  SizedBox(width: 5),
                  Text('200', style: TextStyle(color: Colors.grey, fontSize: 15))
                ]),
              ],
            )
          ]),
        ),
      )
    ]));
  }
}
