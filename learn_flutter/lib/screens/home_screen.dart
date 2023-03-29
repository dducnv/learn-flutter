import 'package:flutter/material.dart';
import 'package:learn_flutter/providers/movie_provider.dart';
import 'package:learn_flutter/screens/my_list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var mylist = context.watch<MovieProvider>().mylist;

    return Scaffold(
      appBar: AppBar(
        title: Text('List movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_)=> const MyListScreen())
              );
            },
            icon: const Icon(Icons.favorite),
            label: Text('go to my list ${mylist.length}'),
            style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 20)),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (_, index) {
                    final currentMovie = movies[index];
                    return Card(
                      key: ValueKey(currentMovie.title),
                      color: Colors.black12,
                      elevation: 4,
                      child: ListTile(
                        title: Text(currentMovie.title),
                        subtitle: Text(currentMovie.runtime ?? 'Unknown'),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite,
                              color: mylist.contains(currentMovie)
                                  ? Colors.red
                                  : Colors.white,
                              size: 30),
                          onPressed: () {
                            if (mylist.contains(currentMovie)) {
                              context
                                  .read<MovieProvider>()
                                  .removeMovieFromFavoriteList(currentMovie);
                            } else {
                              context
                                  .read<MovieProvider>()
                                  .addMovieToFavoriteList(currentMovie);
                            }
                          },
                        ),
                      ),
                    );
                  }))
        ]),
      ),
    );
  }
}
