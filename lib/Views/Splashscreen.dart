import 'package:flutter/material.dart';
import 'package:movie_application/Views/Homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextscreen();
    
  }
  nextscreen() async{
await Future.delayed(Duration(seconds:6));
    Navigator.pushReplacement(context,MaterialPageRoute(builder:(build)=>
    Homescreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(decoration:BoxDecoration(image:DecorationImage(fit:BoxFit.fill,image:NetworkImage(
      "https://st3.depositphotos.com/2021995/13211/i/450/depositphotos_132110706-stock-photo-movie-tiled-letters-concept-and.jpg"
    )))));
  }
}