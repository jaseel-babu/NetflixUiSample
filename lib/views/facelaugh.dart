import 'package:flutter/material.dart';
import 'package:netflixsample/models/consts.dart';

class FaceLaughs extends StatefulWidget {
  const FaceLaughs({Key? key}) : super(key: key);

  @override
  _FaceLaughsState createState() => _FaceLaughsState();
}

class _FaceLaughsState extends State<FaceLaughs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: fetchtoprated(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List upcoming = snapshot.data as List;
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: upcoming.length,
                itemBuilder: (ctx, ind) {
                  return Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            // kToolbarHeight -
                            kBottomNavigationBarHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                'http://image.tmdb.org/t/p/w500' +
                                    upcoming[ind]['poster_path'],
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          icons(Icons.emoji_emotions_rounded, "11k"),
                          icons(Icons.add, "My List"),
                          icons(Icons.share, "Share"),
                          icons(Icons.play_arrow, "Play"),
                        ],
                      )
                    ],
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Column icons(IconData icons, String title) {
    return Column(
      children: [
        Icon(
          icons,
          color: Colors.white,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 22,
        )
      ],
    );
  }
}
