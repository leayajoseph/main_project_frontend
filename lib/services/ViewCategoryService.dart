import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:villagezone/models/CategoryModel.dart';
class CategoryApiService
{
 Future<List<ViewCategory>> getCategory() async{
   var client=http.Client();
   var apiUrl=Uri.parse("http://192.168.43.30:3001/api/category/viewcategory");
   var response=await client.get(apiUrl);
   if(response.statusCode==200)
     {
       return viewCategoryFromJson(response.body);
     }
   else
     {
       return [];
     }
 }
}