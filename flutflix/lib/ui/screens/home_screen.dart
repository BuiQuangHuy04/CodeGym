import 'package:flutflix/controller/movie_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import '../../data/res/data_repo.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = MoviesController(DataRepo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FLUTFLIX',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Trending Movies',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder(
              future: _controller.fetchListData(Constants.TRENDING_EP),
              builder: (context, snapshot) {
                final data = snapshot.data;

                if (data != null &&
                    snapshot.connectionState != ConnectionState.waiting) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 450,
                      aspectRatio: 2 / 3,
                      enlargeCenterPage: true,
                      autoPlay: true,
                    ),
                    items: data.map((movie) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailScreen(movie),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      Constants.MEDIA_API + movie.posterPath!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Top rated movies',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: FutureBuilder(
                future: _controller.fetchListData(Constants.TOPRATED_EP),
                builder: (context, snapshot) {
                  final data = snapshot.data;

                  if (data != null &&
                      snapshot.connectionState != ConnectionState.waiting) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  data.elementAt(index),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(Constants.MEDIA_API +
                                    data.elementAt(index).posterPath!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Upcoming movies',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: FutureBuilder(
                future: _controller.fetchListData(Constants.UPCOMMING_EP),
                builder: (context, snapshot) {
                  final data = snapshot.data;

                  if (data != null &&
                      snapshot.connectionState != ConnectionState.waiting) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  data.elementAt(index),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(Constants.MEDIA_API +
                                    data.elementAt(index).posterPath!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Flutflix',
          ),
        ],
      ),
    );
  }
}
