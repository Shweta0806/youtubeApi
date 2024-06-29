import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtubeapi/Api/Model/ItemModel.dart';
class ApiService{
     static const String _baseUrl ='https://api.freeapi.app/api/v1';

     Future<ItemList> fetchPosts() async{
       final response = await http.get(Uri.parse('$_baseUrl/public/youtube/playlists'));

       if (response.statusCode == 200) {
         Map<String,dynamic> jsonResponse = json.decode(response.body);
         return ItemList.fromJson(jsonResponse);
       } else {
         throw Exception('Failed to load posts');
       }
     }

     }
