import 'package:flutter/material.dart';

import '../model/cast_model.dart';
import '../screens/cast_screen.dart';

class Search extends SearchDelegate<String> {
  final List<Cast> cast;

  Search({required this.cast});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  result() {
    final List<Cast> castList = cast
        .where(
          (list) =>
              list.name!.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ||
              list.character!.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
        )
        .toList();
    return ListView.builder(
      itemCount: castList.length,
      itemBuilder: ((context, index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://image.tmdb.org/t/p/original/${castList[index].profilePath}"),
            ),
            title: Text("${castList[index].name}"),
            subtitle: Text("${castList[index].character}"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => CastScreen(
                    cast: castList[index],
                  ),
                ),
              );
            },
          )),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return result();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return result();
  }
}
