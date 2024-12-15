import 'package:flutter/material.dart';

class Moviedetailsscreen extends StatefulWidget {
  dynamic movie;
  Moviedetailsscreen({super.key, required this.movie});

  @override
  State<Moviedetailsscreen> createState() => _MoviedetailsscreenState();
}

class _MoviedetailsscreenState extends State<Moviedetailsscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor:Colors.black,appBar:AppBar(title:Text(widget.movie["show"]["name"]),
      centerTitle:true,),
        body:SingleChildScrollView(
          child: Column(crossAxisAlignment:CrossAxisAlignment.start
              ,children: [
              
              Container(height:MediaQuery.of(context).size.width/1.8,decoration:BoxDecoration(
              border: Border.all(color:Colors.white),
              image:DecorationImage(image:NetworkImage(widget.movie["show"]["image"]["medium"]
              ),fit: BoxFit.fill))),
              SizedBox(height:5),
           Padding(
             padding: EdgeInsets.all(8.0),
             child: Column(crossAxisAlignment:CrossAxisAlignment.start,
              children: [Text("Title : ${widget.movie["show"]["name"]}",style:TextStyle(color:Colors.white)),
              Text("Language : ${widget.movie["show"]["language"]}",style:TextStyle(color:Colors.white)),
              Text("Genres : ${widget.movie["show"]["genres"]}",style:TextStyle(color:Colors.white)),
              //Text("country : ${widget.movie["show"]["network"]["country"]["name"]}"),
              Text("officialSite : ${widget.movie["show"]["officialSite"]}",style:TextStyle(color:Colors.white)),
              Text("Rating : ${widget.movie["show"]["rating"]["average"]}",style:TextStyle(color:Colors.white)),
              Text("premiered : ${widget.movie["show"]["premiered"]}",style:TextStyle(color:Colors.white)),
              Text("Ended : ${widget.movie["show"]["ended"]}",style:TextStyle(color:Colors.white)),
              Text("Summary : ${widget.movie["show"]["summary"]}",style:TextStyle(color:Colors.white)),
              ],
             ),
           )
          
          ],),
        ),),
    );
  }
}