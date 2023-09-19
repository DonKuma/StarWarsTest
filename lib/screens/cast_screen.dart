import 'package:flutter/material.dart';
import '../model/cast_model.dart';
import 'home_screen.dart';

class CastScreen extends StatefulWidget {
  Cast cast;
  int? heroTag;
  CastScreen({required this.cast, super.key, this.heroTag});

  @override
  State<CastScreen> createState() => _CastScreenState();
}

class _CastScreenState extends State<CastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/fondo2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Card(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.heroTag ?? 0,
                    child: CircleAvatar(
                      radius: 120.0,
                      backgroundImage: NetworkImage(
                          "https://image.tmdb.org/t/p/original/${widget.cast.profilePath}"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '${widget.cast.name}',
                      style: const TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '${widget.cast.character}',
                    style: const TextStyle(
                      fontFamily: 'Source Sans Pro',
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  Card(
                    color: Colors.black,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        'Department : ${widget.cast.knownForDepartment}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.black,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        'Original name : ${widget.cast.originalName}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.black,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        'Gender : ${widget.cast.gender == 1 ? "Female" : "Male"}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.black,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        'popularity : ${widget.cast.popularity}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomeScreen(),
                          ),
                        );
                        // Add your onPressed code here!
                      },
                      backgroundColor: Colors.black,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.yellow,
                      ),
                      label: const Text('BACK'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
