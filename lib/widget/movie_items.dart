import 'package:flutter/material.dart';

class MovieItemBox extends StatelessWidget {
  final String posterPath;
  final String title;
  final int year;
  final String movieDuration;
  final String director;

  const MovieItemBox({
    Key? key,
    required this.posterPath,
    required this.title,
    required this.year,
    required this.movieDuration,
    required this.director,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                posterPath,
                width: 120,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    children: [
                      Icon(Icons.people, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        director,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Wrap(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        '$year',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Wrap(
                    children: [
                      Icon(Icons.access_alarm, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        movieDuration,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
