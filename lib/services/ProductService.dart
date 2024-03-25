

import 'package:http/http.dart' as http;
import 'package:villagezone/models/productModel.dart';

class ProductApiService{
  Future<List<ViewProduct>> getProduct() async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.43.30:3001/api/product/viewproduct");
    var response=await client.get(apiUrl);
    if(response.statusCode==200)
      {
        return viewProductFromJson(response.body);
      }
    else
      {
        return [];
      }
  }
  Future<List<ViewProduct>> getProductByCategory(String category_id) async{
    var apiUrl = Uri.parse("http://192.168.43.30:3001/api/product/product_category?category_id=$category_id");
    var response = await http.get(apiUrl);
    if(response.statusCode==200)
      {
        return viewProductFromJson(response.body);
      }
    else
      {
        return[];
      }
  }
}