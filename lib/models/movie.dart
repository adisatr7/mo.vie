class Movie {
  int id;
  String title;
  String overview;
  List<String> genreIds;
  DateTime releaseDate;
  String backdropPath;
  String posterPath;
  bool adult;
  double popularity;
  bool video;
  double voteAverage;
  int voteCount;
  String originalLanguage;
  String originalTitle;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.genreIds,
    required this.releaseDate,
    required this.backdropPath,
    required this.posterPath,
    required this.adult,
    required this.popularity,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.originalLanguage,
    required this.originalTitle,
  });

  static Movie fromJSON(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        genreIds: json["genre_ids"],
        releaseDate: DateTime.parse(json["release_date"]),
        backdropPath: json["backdrop_path"],
        posterPath: json["poster_path"],
        adult: json["adult"],
        popularity: json["popularity"],
        video: json["video"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
      );
}
