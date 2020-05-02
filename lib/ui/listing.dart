import 'package:flutter/material.dart';
import 'package:moovies/widgets.dart';
import 'package:moovies/models/movie_model.dart';


Widget buildStackedPostCard(BuildContext context, Movie movie) {
  double stackCardHeight = 100;
  double stackImageWidth = 90;

  return Container(
    child: Stack(children: <Widget>[
      Positioned(
        child: MyCard(
          child: Container(
            child: Column(
              children: <Widget>[
                Text(movie.title),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            height: stackCardHeight,
            width: MediaQuery.of(context).size.width - 30,
            padding: EdgeInsets.only(left: stackImageWidth + 5),
          ),
          boxShadow: [smallBoxShadow],
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
                fit: BoxFit.cover,
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

