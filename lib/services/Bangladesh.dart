import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngo_app/services/base_service.dart';
class BangladeshAPIService{

  static Future<http.Response> getDistricitList() async{
    try{
      var response = await http.get(Uri.parse('${BaseService.PUBLIC_API_BASE_URL}/districts'));
      if(response.statusCode==200 && response.body.isNotEmpty){
       // print("The District Data is ${response.body}");
      }
      return response;

    }
    catch(e){
      print(e.toString());
    }
    throw Exception('unable to fetch data');
  }



}

/*
static Future<http.Response> getAllDivision() async{
    try{
      var response = await http.get(Uri.parse('${BaseClass.PUBLIC_API_URL}/divisions'),
      );
      if(response.statusCode==200){
       // print('the division data is ${response.body}');
        return response;
      }
    }
    on Exception catch(e){
      print(e.toString());
    }
    throw Exception;

    }
 */