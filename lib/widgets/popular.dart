import 'package:flutter/material.dart';
import 'package:netflixsample/models/consts.dart';
import 'package:netflixsample/views/trandingdetailspage.dart';
import 'package:bordered_text/bordered_text.dart';

class Popularmovier extends StatefulWidget {
  const Popularmovier({Key? key}) : super(key: key);

  @override
  _PopularfetchingState createState() => _PopularfetchingState();
}

class _PopularfetchingState extends State<Popularmovier> {
  @override
  void initState() {
    fetchPopular();
    super.initState();
  }

  int num = 0;
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
      height: 200,
      child: FutureBuilder(
        future: fetchPopular(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List popular = snapshot.data as List;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (ctx, ind) {
                num = ind + 1;
                return Stack(
                  children: [
                    Container(
                      width: 160,
                      color: Colors.black,
                    ),
                    Positioned(
                      left: 25,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ToprateddetailPag(
                                userselect: popular,
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
                                              popular[ind]['poster_path'],
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 5,
                      child: BorderedText(
                        strokeColor: Colors.white70,
                        strokeWidth: 10.0,
                        child: Text(
                          '$num',
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            decorationColor: Colors.black,
                            fontSize: 80,
                          ),
                        ),
                      ),
                    ),
                    num == 1
                        ? Container()
                        : Container(
                            width: 30,
                            height: 300,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                  ],
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
