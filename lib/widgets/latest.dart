import 'package:flutter/material.dart';
import 'package:netflixsample/models/consts.dart';
import 'package:netflixsample/views/trandingdetailspage.dart';

class Latestfetching extends StatefulWidget {
  const Latestfetching({Key? key}) : super(key: key);

  @override
  _LatestfetchingState createState() => _LatestfetchingState();
}

class _LatestfetchingState extends State<Latestfetching> {
  @override
  void initState() {
    fetchlatest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        movies(),
      ],
    );
  }

  SizedBox movies() {
    return SizedBox(
      height: 220,
      child: FutureBuilder(
        future: fetchlatest(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List latestmovies = snapshot.data as List;
            List rev = latestmovies.reversed.toList();
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: latest.length,
              itemBuilder: (ctx, ind) {
                return InkWell(
                  onTap: () {
                    // showBottomSheet(
                    //   context: context,
                    //   builder: (ctx) {
                    //     return Container(
                    //       height: 200,
                    //       width: double.infinity,
                    //       color: Colors.black,
                    //       child: Column(
                    //         children: [
                    //           ListTile(
                    //             leading: Container(
                    //               width: 100,
                    //               // height: 170,
                    //               child: Image.network(
                    //                 'http://image.tmdb.org/t/p/w500' +
                    //                     latestmovies[ind]['poster_path'],
                    //                 fit: BoxFit.cover,
                    //                 // width: 100,
                    //                 // height: 100,
                    //               ),
                    //             ),
                    //             title: Text(
                    //               latestmovies[ind]['title'],
                    //               style: TextStyle(
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.white),
                    //             ),
                    //             subtitle: Text(
                    //               latestmovies[ind]['overview'],
                    //               style: TextStyle(
                    //                   fontSize: 15, color: Colors.grey),
                    //               maxLines: 4,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //             trailing: Icon(
                    //               Icons.disabled_by_default_outlined,
                    //               color: Colors.grey,
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToprateddetailPag(
                          userselect: rev,
                          ind: ind,
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 145,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 170,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500' +
                                        rev[ind]['poster_path'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
