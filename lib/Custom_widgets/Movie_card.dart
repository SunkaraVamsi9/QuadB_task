import 'package:flutter/material.dart';
import 'package:movie_application/Views/Moviedetailsscreen.dart';
//import 'package:flutter_html/flutter_html.dart';

class Moviecard extends StatefulWidget {
  dynamic moviedetails;
  Moviecard({super.key,required this.moviedetails});

  @override
  State<Moviecard> createState() => _MoviecardState();
}

class _MoviecardState extends State<Moviecard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:5.0),
      child: GestureDetector(onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder:(build)=>
        Moviedetailsscreen(movie:widget.moviedetails)));
      },
        child: Container(decoration:BoxDecoration(color:Colors.black),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
            children: [
              widget.moviedetails["show"]["image"]!=null?Container(height:MediaQuery.of(context).size.width/1.8
              ,decoration:BoxDecoration(
                border: Border.all(color:Colors.white),
              image:DecorationImage(image:NetworkImage(widget.moviedetails["show"]["image"]["medium"]
              ),fit: BoxFit.fill))):
              Expanded(child: Container()),
              SizedBox(height:5),
            Text("Title : ${widget.moviedetails["show"]["name"]}",style:TextStyle(color:Colors.white)),
            Expanded(child: Text("Summary : ${widget.moviedetails["show"]["summary"].toString()}",style:TextStyle(color:Colors.white))),
           SizedBox(height:10,)],
          ),
        ),
      ),
    );
  }
}