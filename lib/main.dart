import 'package:flutter/material.dart';
import 'package:moovies/ui/listing.dart';
import 'package:moovies/services/api.dart';
import 'package:moovies/models/movie_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        cardTheme: CardTheme(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 0
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Movie>> futureMovieList;

  @override
  void initState() {
    super.initState();
    futureMovieList = getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Image.asset('assets/images/moovies_logo.png'),
          width: 150,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot.hasData
            ? MovieListing(movies: snapshot.data)
            : snapshot.hasError
                ? Text('${snapshot.error}')
                : Center(child: CircularProgressIndicator()),
        future: futureMovieList,
      ),
    );
  }
}


