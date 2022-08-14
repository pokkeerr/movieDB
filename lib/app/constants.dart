// ignore_for_file: constant_identifier_names

const EMPTY = "";

class Constants {
  static const String Api_vertion = "3";
  static const String API_KEY = "d4423b8e53b84795334616e5a04ae328";
  static const String READ_ACCESS_TOKEn =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDQyM2I4ZTUzYjg0Nzk1MzM0NjE2ZTVhMDRhZTMyOCIsInN1YiI6IjYyZjc5MDVmZTMyM2YzMDA3YmM5NzE0OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tFibFwNmkKwyYaw7VpyWlJvf3uGO6eSLjJSK12UVaKc";
  static const String baseUrl = "https://api.themoviedb.org/$Api_vertion/";
  static const getPopularPersons = "${baseUrl}person/popular?api_key=$API_KEY";
}
