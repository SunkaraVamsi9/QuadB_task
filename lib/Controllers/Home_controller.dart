import "dart:convert";

import "package:http/http.dart" as http;
class Homecontroller{
Future<List> getallmoviedetails()async{
  final url="https://api.tvmaze.com/search/shows?q=all";
  final result=await http.get(Uri.parse(url));
  if(result.statusCode==200 || result.statusCode== 201){
    return jsonDecode(result.body);
  }
  else{
    return [];
  }
}
Future<List> getsearchmoviedetails(String search)async{
  final url="https://api.tvmaze.com/search/shows?q=${search}";
  final result=await http.get(Uri.parse(url));
  if(result.statusCode==200 || result.statusCode== 201){
    return jsonDecode(result.body);
  }
  else{
    return [];
  }
}
}