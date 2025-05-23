import 'package:movies_list/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_list/controller/movie_controller.dart';
import 'package:movies_list/widget/movie_items.dart';

class MovieListPage extends StatelessWidget {
  final movieController = Get.put(MovieController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 29, 43),
      body: Column(
        children: [
          const SizedBox(height: 48),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      movieController.setSearch(value);
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 37, 40, 54),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed:
                    () => {
                      movieController.clearSearch,
                      searchController.clear(),
                    },
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text("Cancel"),
              ),
              SizedBox(width: 24),
            ],
          ),
          Expanded(
            child: Obx(() {
              if (movieController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (movieController.filteredMovies.isEmpty) {
                return Center(child: Text('No movies found'));
              } else {
                return ListView.builder(
                  itemCount: movieController.filteredMovies.length,
                  itemBuilder: (context, index) {
                    final movie = movieController.filteredMovies[index];
                    return MovieItemBox(
                      posterPath: movie.posterPath,
                      title: movie.title,
                      year: movie.year,
                      movieDuration: movie.movieDuration,
                      director: movie.director,
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
