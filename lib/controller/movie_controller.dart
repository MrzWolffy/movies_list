import 'package:get/get.dart';
import 'package:movies_list/models/movie_model.dart';
import 'package:movies_list/services/movies_service.dart';

class MovieController extends GetxController {
  var movies = <Movie>[].obs;
  var isLoading = false.obs;
  var searchTerm = ''.obs;

  List<Movie> get filteredMovies {
    if (searchTerm.value.isEmpty) {
      return movies;
    } else {
      return movies
          .where(
            (movie) => movie.title.toLowerCase().contains(
              searchTerm.value.toLowerCase(),
            ),
          )
          .toList();
    }
  }

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var moviesList = await MoviesService().fetchMovies();
      movies.assignAll(moviesList);
    } finally {
      isLoading(false);
    }
  }

  void setSearch(String value) {
    searchTerm(value);
  }

  void clearSearch() {
    searchTerm('');
  }
}
