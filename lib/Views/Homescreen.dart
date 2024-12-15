import 'package:flutter/material.dart';
import 'package:movie_application/Controllers/Home_controller.dart';
import 'package:movie_application/Custom_widgets/Movie_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedindex=0;
  final _controller=Homecontroller();
  dynamic searchresult;
  TextEditingController searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(toolbarHeight:65,automaticallyImplyLeading:false,title:selectedindex==0?Text("Movies",style:TextStyle(fontSize:25,
        fontWeight: FontWeight.bold)):TextFormField(controller:searchcontroller,
        decoration:InputDecoration(border:OutlineInputBorder(),
        prefixIcon:Icon(Icons.search),
        hintText:"Search for movie"),
        onChanged:(val)async{
              setState(() {
        
              });      },
        ),centerTitle:true,),
        body:selectedindex==0?FutureBuilder(
          future:_controller.getallmoviedetails(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasData && snapshot.data!=[]){
            return ListView.builder(shrinkWrap:true,itemCount:snapshot.data!.length, 
            itemBuilder:(build,index){
            return IntrinsicHeight(child: Moviecard(moviedetails:snapshot.data?[index]));
            });
          }
       else{
      return Center(child:Text("No data found"));
       } })
        :searchscreen(),
        bottomNavigationBar:BottomNavigationBar(
          onTap:(index){
          setState(() {
            selectedindex=index;
          });
        },currentIndex:selectedindex,items:[BottomNavigationBarItem(icon:Icon(Icons.home),label:"Home"),
        BottomNavigationBarItem(icon:Icon(Icons.search),label:"Search")]),
      ),
    );
  }
  searchscreen(){
    return searchcontroller.text!=""?FutureBuilder(
        future:_controller.getsearchmoviedetails(searchcontroller.text),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData && snapshot.data!.isNotEmpty){
          return ListView.builder(shrinkWrap:true,itemCount:snapshot.data!.length, 
          itemBuilder:(build,index){
          return IntrinsicHeight(child: Moviecard(moviedetails:snapshot.data?[index]));
          });
        }
     else{
return Center(child:Text("No data found"));
     } }):null;
  }
}