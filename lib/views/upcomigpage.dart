import 'package:flutter/material.dart';
import 'package:netflixsample/models/consts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  void initState() {
    super.initState();
    //getEffect();
  }

  // getEffect() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   await Future.delayed(Duration(seconds: 5), () {});
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // bool isLoading = false;
  // Widget buildEffect() {
  //   return Shimmer.fromColors(
  //       baseColor: Colors.black,
  //       highlightColor: Colors.black54,
  //       child: Column(
  //         children: [
  //           Container(
  //             color: Colors.grey[800],
  //             width: double.infinity,
  //             height: 250,
  //           ),
  //         ],
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  snap: false,
                  backgroundColor: Colors.black,
                  expandedHeight: 80.0,
                  floating: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: AppBar(
                      backgroundColor: Colors.transparent,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Coming Soon',
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Notification',
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // SliverAppBar(
                //   snap: true,
                //   backgroundColor: Colors.black,
                //   expandedHeight: 80.0,
                //   floating: true,
                //   pinned: true,
                //   title: AppBar(
                //     backgroundColor: Colors.transparent,
                //     title: const ListTile(
                //       leading: Icon(
                //         Icons.notifications_none,
                //         color: Colors.white,
                //       ),
                //       title: Text(
                //         'Notification',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //       trailing: Icon(
                //         Icons.arrow_forward_ios_sharp,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
              ];
            },
            body: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder(
                future: fetchupcoming(),
                builder: (context, snapshot) {
                  Future.delayed(const Duration(seconds: 4), () {});
                  // if (isLoading) {
                  //   return buildEffect();
                  // }
                  if (snapshot.hasData) {
                    List upcoming = snapshot.data as List;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: upcoming.length,
                        itemBuilder: (ctx, ind) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500' +
                                                upcoming[ind]['backdrop_path'],
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                upcoming[ind]['title'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                upcoming[ind]['release_date'],
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                upcoming[ind]['overview'],
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                thickness: 1.0,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        });
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
