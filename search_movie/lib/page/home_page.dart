import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:search_movie/model/movie_data.dart';
import 'package:search_movie/service/fetchmovies.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> fetchedmovie=[];
  TextEditingController searchtearm = TextEditingController();

  void searchg () async{

    fetchedmovie = await fetchmovie(searchtearm.text);
    setState(() {
      
    });

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        
        padding: const EdgeInsets.fromLTRB(20,30,20,20),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: searchtearm,
                decoration: InputDecoration(
                  hintText: 'enter a movie name'
                ),
                onEditingComplete: searchg
              ),
            ),
            
              
          
            for (Movie item in fetchedmovie) 
            MovieTiles(item: item,searchterm: searchtearm.text,)
            
          ],
        ),
      ),
    );
  }
}

class MovieTiles extends StatelessWidget {
  Movie? item;
  String? searchterm;
   MovieTiles({Key? key,this.item,this.searchterm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Column(
          children: [
            Image.network(item!.poster!),
            Text(item!.title!,style: TextStyle(fontSize: 22),),
            Text(item!.type!,style: TextStyle(fontSize: 22)),
            Text(item!.year!,style: TextStyle(fontSize: 22)),
            Text(searchterm!,style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}