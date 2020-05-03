import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromMap(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toMap());

const GENRES = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western"
};

class Movie {
  final double popularity;
  final int voteCount;
  final String endPosterPath;
  final int id;
  final String backdropPath;
  final List<int> genreIds;
  final String title;
  final double voteAverage;
  final String overview;
  final DateTime releaseDate;
  List<String> genres = [];

  Movie({
    this.popularity,
    this.voteCount,
    this.endPosterPath,
    this.id,
    this.backdropPath,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  }) {
    this.populateGenres(genreIds);
  }

  get posterPath => 'https://image.tmdb.org/t/p/w500${this.endPosterPath}';

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
    voteCount: json["vote_count"] == null ? null : json["vote_count"],
    endPosterPath: json["poster_path"] == null ? null : json["poster_path"],
    id: json["id"] == null ? null : json["id"],
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
    title: json["title"] == null ? null : json["title"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    overview: json["overview"] == null ? null : json["overview"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
  );

  Map<String, dynamic> toMap() => {
    "popularity": popularity == null ? null : popularity,
    "vote_count": voteCount == null ? null : voteCount,
    "poster_path": endPosterPath == null ? null : endPosterPath,
    "id": id == null ? null : id,
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
    "title": title == null ? null : title,
    "vote_average": voteAverage == null ? null : voteAverage,
    "overview": overview == null ? null : overview,
    "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
  };

  void populateGenres(genreIds) {
    for (int i = 0; i < genreIds.length; i++) {
      int genreId = genreIds[i];

      this.genres.add(GENRES[genreId]);
    }
  }

}



