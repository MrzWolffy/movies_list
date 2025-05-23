class Movie {
  final String title;
  final int year;
  final String releaseDate;
  final String director;
  final String movieDuration;
  final String posterPath;

  Movie({
    required this.title,
    required this.year,
    required this.releaseDate,
    required this.posterPath,
    required this.director,
    required this.movieDuration,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['movie'] ?? 'No Title',
      year: json['year'] ?? 'No Year',
      releaseDate: json['release_date'] ?? 'No Release Date',
      director: json['director'] ?? 'No Director',
      movieDuration: json['movie_duration'] ?? 'No Movie Duration',
      posterPath: json['poster'] ?? 'No Poster Path',
    );
  }
}
