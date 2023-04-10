import 'package:comics_app/src/constants/color.global.dart';
import 'package:comics_app/src/models/book.dart';
import 'package:comics_app/src/models/category.dart';
import 'package:comics_app/src/ui/widgets/book_item_row.dart';
import 'package:flutter/material.dart';

class RankItem extends StatelessWidget {
  CategoryModel? categoryModel;
 RankItem({ Key? key,this.categoryModel }) : super(key: key);

  @override
  Widget build(BuildContext context){
      List<BookModel> rankBookItem = categoryModel!.data!.map((e) {
      return BookModel.fromJson(e);
    }).toList();
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${categoryModel!.title}',
            style: TextStyle(
                color: GlobalColors.orangeColor,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
                SizedBox(height: 10,),
                for(int i =0; i< rankBookItem!.length; i++)
                Column(
                  children: [
                    BookItemRow(bookModel: rankBookItem[i], index:i+1),
                  SizedBox(height: 10,)
                  ],
                )
      ],
    );
  }
}