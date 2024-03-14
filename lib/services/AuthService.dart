import 'dart:convert';

import 'package:http/http.dart' as http;

class UserAuthApiService
{
  Future<dynamic> UserLogin(
      String email,String password
      )async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.29.217:3001/api/auth/login");
    var response=await client.post(apiUrl,
    headers:<String,String>{
      "Content-Type":"application/json ; charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
      "email":email,
      "password":password
    }));
    if(response.statusCode==200)
      {
        return jsonDecode(response.body);
      }
    else
      {
        throw Exception("Failed");
      }
  }
  Future<dynamic> sendUserData(
      String email, String password, String name, String phone, String address, String pincode
      ) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.29.217:3001/api/auth/signup");
    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type":"application/json; charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
      "address": address,
      "pincode": pincode
    }));
    if(response.statusCode==200)
      {
        return json.decode(response.body);
      }
    else
      {
        throw Exception("Failed to send data");
      }
  }
}