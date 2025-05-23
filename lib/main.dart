import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_list/views/movieList_view.dart';

void main() {
  runApp(
    GetMaterialApp(debugShowCheckedModeBanner: false, home: MovieListPage()),
  );
}
