import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cast_model.dart';
import '../provider/provide_starwars.dart';
import '../widgets/cast_card_widget.dart';
import '../widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    List<Cast> castSearch = [];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/fondo1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Top Container
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'lib/assets/LogoWhite.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //search bar
                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: Search(
                              cast: castSearch,
                            ));
                      },
                      icon: const Icon(Icons.search),
                      label: const Text("Search"),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 100, right: 100),
                        primary: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 156, 156, 156),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 250,
                    width: 180,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(70),
                      ),
                      image: DecorationImage(
                        image: AssetImage('lib/assets/yoda.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    child: Text(
                      "Cast",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => StarWarsProvider(),
                    child: Consumer<StarWarsProvider>(
                      builder: (BuildContext context,
                          StarWarsProvider controller, Widget? _) {
                        if (controller.isLoading == null) {
                          Future(() {
                            controller.getAll();
                          });
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (controller.isLoading!) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          castSearch = controller.cast;
                          final castList = controller.cast;
                          return SizedBox(
                            height: 250,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 20),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: castList.length,
                              itemBuilder: (context, index) {
                                return CastCard(
                                  cast: castList[index],
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
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
