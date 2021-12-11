import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixsample/models/consts.dart';
import 'package:netflixsample/views/downloads.dart';
import 'package:netflixsample/views/facelaugh.dart';
import 'package:netflixsample/views/upcomigpage.dart';
import 'package:netflixsample/widgets/latest.dart';
import 'package:netflixsample/widgets/popular.dart';
import 'package:netflixsample/widgets/tranding.dart';
import 'package:netflixsample/views/trandingdetailspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static final _containerHeight = 100.0;
  // var _fromTop = -_containerHeight;
  // var _controller = ScrollController();
  // var _allowReverse = true, _allowForward = true;
  // var _prevOffset = 0.0;
  // var _prevForwardOffset = -_containerHeight;
  // var _prevReverseOffset = 0.0;
  Moviefetching movie = const Moviefetching();
  final Popularmovier _popularmovier = const Popularmovier();
  Latestfetching latest = const Latestfetching();
  int selectedIndex = 0;
  onItemTapped(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  // ignore: prefer_final_fields

  // @override
  // void initState() {
  //   super.initState();
  //   _controller.addListener(_listener);
  // }

  // void _listener() {
  //   double offset = _controller.offset;
  //   var direction = _controller.position.userScrollDirection;

  //   if (direction == ScrollDirection.reverse) {
  //     _allowForward = true;
  //     if (_allowReverse) {
  //       _allowReverse = false;
  //       _prevOffset = offset;
  //       _prevForwardOffset = _fromTop;
  //     }

  //     var difference = offset - _prevOffset;
  //     _fromTop = _prevForwardOffset + difference;
  //     if (_fromTop > 0) _fromTop = 0;
  //   } else if (direction == ScrollDirection.forward) {
  //     _allowReverse = true;
  //     if (_allowForward) {
  //       _allowForward = false;
  //       _prevOffset = offset;
  //       _prevReverseOffset = _fromTop;
  //     }

  //     var difference = offset - _prevOffset;
  //     _fromTop = _prevReverseOffset + difference;
  //     if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
  //   }
  //   setState(() {});
  // }

  scrollappbar() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      // controller: _controller,
      itemBuilder: (_, index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  excludeHeaderSemantics: true,
                  snap: true,
                  backgroundColor: Colors.transparent,
                  // expandedHeight: 80.0,
                  floating: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: AppBar(
                      backgroundColor: Colors.transparent,
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        // radius: 40,
                        child: Image.asset(
                          'asstes/images/netflix_PNG15.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
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
                ),
                SliverAppBar(
                  snap: false,
                  backgroundColor: Colors.transparent,
                  expandedHeight: 80.0,
                  floating: false,
                  pinned: true,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "TV Shows",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const Text(
                          "Movies",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        InkWell(
                          onTap: () async {
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Container(
                                    color: Colors.transparent,
                                    // title: Text("Categories"),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: categories.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            categories[index] == "Home"
                                                ? Text(
                                                    categories[index],
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : Text(
                                                    categories[index],
                                                    style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  floatingActionButton: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingActionButtonLocation:
                                      FloatingActionButtonLocation.centerFloat,
                                );
                              },
                            );
                          },
                          child: Row(
                            children: const [
                              Text(
                                "Categories",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            FutureBuilder(
                                future: fetchtoprated(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List topratedmovies = snapshot.data as List;
                                    return SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        foregroundDecoration:
                                            const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black,
                                              Colors.transparent,
                                              Colors.transparent,
                                              Colors.black
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: [0, 0.0, 0, 15],
                                          ),
                                        ),
                                        child: Image.network(
                                          'http://image.tmdb.org/t/p/w500' +
                                              topratedmovies[8]['poster_path'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();
                                }),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 250,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'asstes/images/netflix_PNG15.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const Text(
                                          'SERIES',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              letterSpacing: 2.8,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    FutureBuilder(
                                      future: fetchtoprated(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          List topratedmovies =
                                              snapshot.data as List;
                                          return Text(
                                            topratedmovies[8]['title'],
                                            style: const TextStyle(
                                              fontFamily: "Georgia",
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Ominous  ',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: Colors.orange,
                                          size: 5,
                                        ),
                                        Text(
                                          '  Exciting  ',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: Colors.orange,
                                          size: 5,
                                        ),
                                        Text(
                                          ' Teen ',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'My List',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            'Play',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.info,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Info',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Top Rated',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        movie,
                        const Text(
                          'Top Ten ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        _popularmovier,
                        const Text(
                          'Only On Netflix ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        latest,
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget _yourContainer() {
  //   return Opacity(
  //     opacity: 1 - (-_fromTop / _containerHeight),
  //     child: Container(
  //       height: _containerHeight,
  //       color: Colors.transparent,
  //       alignment: Alignment.center,
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: const [
  //             Text(
  //               "TV Shows",
  //               style: TextStyle(color: Colors.white, fontSize: 17),
  //             ),
  //             Text(
  //               "Movies",
  //               style: TextStyle(color: Colors.white, fontSize: 17),
  //             ),
  //             Text(
  //               "My List",
  //               style: TextStyle(color: Colors.white, fontSize: 17),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOption = [
      scrollappbar(),
      Upcoming(),
      // Upcoming(),
      DownloadPage(),
      FaceLaughs(),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: _widgetOption[selectedIndex],
      // Stack(
      //   children: [

      // Positioned(
      //   top: _fromTop,
      //   left: 0,
      //   right: 0,
      //   child: _yourContainer(),
      // )
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          // BottomNavigationBarItem(
          //   label: "Serach",
          //   icon: Icon(
          //     Icons.search,
          //   ),
          // ),
          BottomNavigationBarItem(
            label: "Upcoming",
            icon: Icon(Icons.ondemand_video_sharp),
          ),
          BottomNavigationBarItem(
            label: "Downloads",
            icon: Icon(Icons.download),
          ),
          BottomNavigationBarItem(
            label: "Laugh Face",
            icon: Icon(Icons.emoji_emotions_rounded),
          ),
        ],
        onTap: onItemTapped,
        currentIndex: selectedIndex,
      ),
    );
  }
}
