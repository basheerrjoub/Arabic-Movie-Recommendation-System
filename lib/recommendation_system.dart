import 'dart:math';
import "./movie.dart";

Movie recommend(List<int> userFeatures) {
  List<List<int>> movies = [
    [3, 1, 1],
    [4, 0, 1],
    [2, 0, 2],
    [3, 0, 2],
    [1, 1, 0],
    [3, 1, 0],
  ];
  List<String> movie_name = [
    "John Wick: Chapter 4",
    "Parasite",
    "The Shining",
    "God Father",
    "Good Bad & Ugly",
    "2001: A space Odyssey",
    "The Dark Knight",
  ];

  int closestMovieIndex = findClosestMovie(movies, userFeatures);
  print('The closest movie index is: ${movie_name[closestMovieIndex]}');
  final String image_source = "images/${closestMovieIndex}.jpg";
  print(image_source);

  Movie m = Movie(movie_name[closestMovieIndex], image_source);
  return m;
}

int findClosestMovie(List<List<int>> movies, List<int> userFeatures) {
  int closestIndex = -1;
  double minDistance = double.infinity;

  for (int i = 0; i < movies.length; i++) {
    double distance = euclideanDistance(userFeatures, movies[i]);
    if (distance < minDistance) {
      minDistance = distance;
      closestIndex = i;
    }
  }

  return closestIndex;
}

double euclideanDistance(List<int> a, List<int> b) {
  if (a.length != b.length) {
    throw ArgumentError("Both lists must have the same length.");
  }

  double sum = 0;
  for (int i = 0; i < a.length; i++) {
    sum += pow(a[i] - b[i], 2);
  }

  return sqrt(sum);
}
