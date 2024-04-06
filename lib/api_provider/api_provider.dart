
import 'dart:convert';

import 'package:apicall/get_data_screen/model/comments_model.dart';
import 'package:http/http.dart' as http;


abstract class ApiProvider {
  String get baseUrl;
  String get apiUrl;
  Uri getUrl({String endPoint = ''}) => Uri.parse(baseUrl + apiUrl + endPoint);
 
 

  _delete({required String endPoint}) async {
    var response = await http.delete(getUrl(endPoint: endPoint));
    return response;
  }

  _fetch({String endPoint = ''}) async {
    var response = await http.get(getUrl(endPoint: endPoint));
    if (response.statusCode == 200) {
      return await jsonDecode(response.body);
    } else {
      return null;
    }
  }
}

class CommentsApiProvider extends ApiProvider {
  @override
  // TODO: implement apiUrl
  String get apiUrl => '/comments';

  @override
  // TODO: implement baseUrl
  String get baseUrl => '/commentshttps://jsonplaceholder.typicode.com/posts/1;
  Future<List<Comments>> fetchComments() async {
    List map = await _fetch() as List;
    return map.map((map) => Comments.fromMap(map)).toList();
  }
  Future<bool> delete(String endPoint) async {
    return await _delete(endPoint: endPoint);
  }
}



