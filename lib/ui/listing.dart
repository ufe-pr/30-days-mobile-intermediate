import 'package:flutter/material.dart';
import 'package:moovies/widgets.dart';
import 'package:moovies/models/movie_model.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardWidget({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double stackCardHeight = 100;
    double stackImageWidth = 90;

    return Container(
      child: Stack(children: <Widget>[
        Positioned(
          child: MyCard(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Expanded(
                    child: Text(
                      movie.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff222222),
                        height: 1.7,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          movie.genres.reduce(
                              (value, element) => value + ' | ' + element),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                      ),
                      Text(
                        movie.voteAverage.toString(),
                        style: Theme.of(context).textTheme.subtitle,
                      )
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              height: stackCardHeight,
              width: MediaQuery.of(context).size.width - 30,
              padding: EdgeInsets.fromLTRB(stackImageWidth + 5, 10, 10, 10),
            ),
            boxShadow: [bigBoxShadow],
          ),
          top: 0,
          left: 0,
        ),
        Positioned(
          child: Card(
            child: Container(
                height: stackCardHeight,
                width: stackImageWidth,
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.fill,
                )),
            margin: EdgeInsets.zero,
          ),
          top: 0,
          left: 0,
        ),
      ], overflow: Overflow.visible),
      height: stackCardHeight + 10,
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }
}

class MovieListing extends StatelessWidget {
  final List<Movie> movies;
  const MovieListing({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          MovieCardWidget(movie: movies[index]),
      itemCount: movies.length,
      padding: EdgeInsets.all(10),
    );
  }
}



