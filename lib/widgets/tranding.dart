import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflixsample/models/consts.dart';
import 'package:netflixsample/views/trandingdetailspage.dart';

class Moviefetching extends StatefulWidget {
  const Moviefetching({Key? key}) : super(key: key);

  @override
  _MoviefetchingState createState() => _MoviefetchingState();
}

class _MoviefetchingState extends State<Moviefetching> {
  @override
  void initState() {
    fetchtoprated();
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
      height: 200,
      child: FutureBuilder(
        future: fetchtoprated(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List topratedmovies = snapshot.data as List;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topratedmovies.length,
              itemBuilder: (ctx, ind) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToprateddetailPag(
                          userselect: topratedmovies,
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
                                        topratedmovies[ind]['poster_path'],
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
