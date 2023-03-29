import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_flutter/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final myList = context.watch<MovieProvider>().mylist;
    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${myList.length})"),
      ),
      body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (_, index) {
            final currentMovie = myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 4,
              child: ListTile(
                  title: Text(currentMovie.title),
                  subtitle: Text(currentMovie.runtime ?? 'Unknown'),
                  trailing: TextButton(
                    child: Text('remove'),
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .removeMovieFromFavoriteList(currentMovie);
                    },
                  )),
            );
          }),
    );
  }
}
