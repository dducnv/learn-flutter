import 'dart:math';

import 'package:flutter/material.dart';

import '../models/movie.dart';

final List<Movie> initialData = List.generate(
    50,
    (index) =>
        Movie(title: 'Movie $index', runtime: '${Random().nextInt(100) + 60}'));

class MovieProvider with ChangeNotifier{
  //Danh sach phim
  final List<Movie> _movies = initialData;
  List<Movie> get movies => _movies;
  //Danh sach yeu thich
  final List<Movie >_mylist = [];
  List<Movie> get mylist => _mylist;

  void addMovieToFavoriteList(Movie movie){
    _mylist.add(movie);
    notifyListeners();
  }

  void removeMovieFromFavoriteList (Movie movie){
    _mylist.remove(movie);
    notifyListeners();
  }
}
