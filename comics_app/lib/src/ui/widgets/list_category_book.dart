import 'dart:math';

import 'package:comics_app/src/models/category.dart';
import 'package:comics_app/src/networks/network_request.dart';
import 'package:comics_app/src/ui/widgets/cetegory_item_list_view.dart';
import 'package:comics_app/src/ui/widgets/rank_list_view.dart';
import 'package:flutter/material.dart';

class ListCategoryBook extends StatefulWidget {
  const ListCategoryBook({Key? key}) : super(key: key);

  @override
  State<ListCategoryBook> createState() => _ListCategoryBookState();
}

class _ListCategoryBookState extends State<ListCategoryBook> {
  List<CategoryModel> categoryList = [];

  @override
  void initState() {
    NetworkRequest.fetchCategories().then((res) {
      setState(() {
        categoryList = res;
      });
    }).catchError((onError) {
      print(e.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryList.length,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, int index) {
        return categoryList[index].title == "Bảng xếp hạng"
            ? RankListView(categoryModel: categoryList[index])
            : CategoryItemListView(categoryModel: categoryList[index]);
      },
    );
  }
}
