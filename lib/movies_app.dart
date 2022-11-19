import 'package:flutter/material.dart';
import 'package:movies_app/movie.dart';
import './movie.dart';

class moviesApp extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  // final List movies = [
  //   'Tatanic',
  //   'rashka',
  //   'moneyhiest',
  //   'squidgame',
  //   'fan',
  //   'bigman',
  //   'legend',
  //   'josh',
  //   'kuch kuch',
  //   'best doctor',
  //   ' i am legend',
  //   'goat',
  //   'kings',
  //   'goat rashka',
  //   'world',
  //   'yet movies'
  // ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade400,
      appBar: AppBar(
        title: Text('Movies_app'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext, int index) {
            return Stack(children:[ 

          Positioned(
            
            child: movieIMG(movieList[index].images[0])),
              
              
              Positioned(
                top: 10.0,
                child: movieCard(movieList[index], context)),
            
              
              ]);
          }),
    );
  }

  Widget movieCard(Movie movie,BuildContext context){
    return InkWell(
     
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
            

          ),
          child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,
              left: 54),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(movie.title),

                      Text("Rating:${movie.imdbRating}/10"),
                    ],
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       

                      Text("Released:${movie.released}/10"),
                      Text(movie.runtime),
                      Text(movie.rated),
                    


                    ],
                  )



                ],
              ),
            ),
          ),
        ),
     onTap: () {
       
       Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => movieListView(
                                movieName: movie.title,
                                
                              )));
     },
    );
  }

  Widget movieIMG(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
         image: DecorationImage(image: NetworkImage(imageUrl  ),fit: BoxFit.cover)
      ),
    );

  }

}

class movieListView extends StatelessWidget {
  final movieName;
  // final Movie movie;

  const movieListView({super.key,this.movieName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('movies'),
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Text('GO BACK ')),
        ),
      ),
    );
  }
}




// Card(
//               elevation: 6,
//               color: Colors.white,
//               child: ListTile(
                
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => movieListView(
//                                 movieName: movieList.elementAt(index).title,
//                               )));
//                 },
//                 leading: CircleAvatar(
//                   child: Container(
//                     width: 200,
//                     height: 200,
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(13.5)
//                         ,image: DecorationImage(image: NetworkImage(movieList[index].images[0]),fit: BoxFit.cover)),
//                     child: null,
//                   ),
//                 ),
//                 trailing: Text('...'),
//                 title: Text(movieList[index].title),
//                 subtitle: Text(' ${movieList[0].title}'),
//               ),
//             );