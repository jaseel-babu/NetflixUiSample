import 'package:flutter/material.dart';
import 'package:netflixsample/models/consts.dart';

class DownloadPage extends StatefulWidget {
  DownloadPage({Key? key}) : super(key: key);

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                snap: false,
                backgroundColor: Colors.transparent,
                // expandedHeight: 80.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: AppBar(
                    backgroundColor: Colors.transparent,
                    title: const Text('Downloads'),
                    actions: [
                      const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'asstes/images/e39430434d2b8207188f880ac66c6411.png',
                          // width: 30,
                          height: 10,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                const ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Smart Downloads',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'asstes/images/e39430434d2b8207188f880ac66c6411.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: const Text(
                    'Jaseel',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                FutureBuilder(
                    future: fetchPopular(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List popular = snapshot.data as List;
                        return Column(
                          children: [
                            downloads(popular, 5),
                            downloads(popular, 10),
                          ],
                        );
                      }
                      return Container();
                    }),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Introducing Downloads for You',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "We'll download a personalised selection of movies and shows for you. so these always something to watch on your phone.",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FutureBuilder(
                      future: fetchPopular(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List popular = snapshot.data as List;
                          return Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 250,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[850],
                                ),
                              ),
                              Positioned(
                                left: 80,
                                bottom: 10,
                                child: RotationTransition(
                                  turns:
                                      const AlwaysStoppedAnimation(-15 / 360),
                                  child: Container(
                                    height: 180,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500' +
                                                popular[2]['poster_path'],
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 180,
                                child: RotationTransition(
                                  turns: const AlwaysStoppedAnimation(10 / 360),
                                  child: Container(
                                    height: 180,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500' +
                                                popular[5]['poster_path'],
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  height: 205,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'http://image.tmdb.org/t/p/w500' +
                                              popular[8]['poster_path'],
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Set Up',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue[900]),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile downloads(List<dynamic> popular, int index) {
    return ListTile(
      leading: Container(
        height: 90,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'http://image.tmdb.org/t/p/w500' +
                    popular[index]['poster_path'],
              ),
              fit: BoxFit.fill),
        ),
      ),
      title: Text(
        popular[index]['title'],
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
      ),
      subtitle: const Text(
        "16-17 Episods |5.8 GB",
        style: TextStyle(color: Colors.white70, fontSize: 14),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: Colors.white70,
      ),
    );
  }
}
