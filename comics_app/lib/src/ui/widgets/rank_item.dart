import 'package:comics_app/src/constants/color.global.dart';
import 'package:comics_app/src/ui/widgets/book_item_row.dart';
import 'package:flutter/material.dart';

class RankItem extends StatelessWidget {
const RankItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Truyện tranh',
            style: TextStyle(
                color: GlobalColors.orangeColor,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
        SizedBox(height: 10),
        BookItemRow(),
        SizedBox(height: 10),
        BookItemRow(),
        SizedBox(height: 10),
        BookItemRow(),
        SizedBox(height: 10),
        BookItemRow(),
      ],
    );
  }
}