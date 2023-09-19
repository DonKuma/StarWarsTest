import 'package:flutter/material.dart';
import '../model/cast_model.dart';
import '../screens/cast_screen.dart';

class CastCard extends StatelessWidget {
  Cast cast;
  CastCard({required this.cast, super.key});

  @override
  Widget build(BuildContext context) {
    final index = cast.id;
    return Column(
      children: [
        Hero(
          tag: index!,
          child: Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/original/${cast.profilePath}"),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => CastScreen(
                    cast: cast,
                    heroTag: index,
                  ),
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            cast.name ?? "",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            cast.character ?? "",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
