import 'package:flutter/material.dart';
import 'package:netflixsample/models/consts.dart';
import 'package:netflixsample/views/upcomigpage.dart';

class ToprateddetailPag extends StatefulWidget {
  dynamic userselect;
  int ind;
  ToprateddetailPag({Key? key, required this.userselect, required this.ind})
      : super(key: key);

  @override
  _ToprateddetailPagState createState() => _ToprateddetailPagState();
}

class _ToprateddetailPagState extends State<ToprateddetailPag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'http://image.tmdb.org/t/p/w500' +
                              widget.userselect[widget.ind]['backdrop_path'],
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
                )
              ],
            ),
            Text(
              widget.userselect[widget.ind]['title'],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.userselect[widget.ind]['release_date'],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Play',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Download',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[900]),
                  ),
                ),
              ),
            ),
            Text(
              widget.userselect[widget.ind]['overview'],
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 120,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                  ),
                  Text(
                    "Most Liked",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons(Icons.add, 'My List'),
                buttons(Icons.thumb_up, 'Rate'),
                buttons(Icons.share, 'Share'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          const BottomNavigationBarItem(
            label: "Serach",
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            label: "Upcoming",
            icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Upcoming()));
                },
                icon: const Icon(Icons.ondemand_video_sharp)),
          ),
          const BottomNavigationBarItem(
            label: "Downloads",
            icon: Icon(Icons.download),
          ),
          const BottomNavigationBarItem(
            label: "More",
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }

  Column buttons(IconData iconss, String name) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconss,
            color: Colors.white,
          ),
        ),
        Text(
          name,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
