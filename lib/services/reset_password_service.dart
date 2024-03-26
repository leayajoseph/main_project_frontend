import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:villagezone/models/reset_password_model.dart';

class ResetPasswordApiServce{
  Future<ResetPasswordModel> otpLogin(String email) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.29.217:3001/api/auth/otp-reset-password");
    var response=await client.post(apiUrl,
    headers: {
      "Content-Type":"application/json; charset=UTF-8"
    },
    body: jsonEncode(
        {
      "email":email
    }));
    if(response.statusCode==200)
      {
        return resetPasswordModel(response.body);
      }
    if(response.statusCode==404)
      {
        return resetPasswordModel(response.body);
      }
    else
      {
        throw Exception("Failed");
      }

  }

  Future<ResetPasswordModel> verifyOtp(String email, String otpHash,String otpCode)async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.29.217:3001/api/auth/otp-verify");
    var response=await client.post(apiUrl,
        headers:
        {
      "Content-Type":"application/json ; charset=UTF-8"
        },
    body: jsonEncode(
        {
      "email": email,
      "otp": otpCode,
      "hash": otpHash
    }));
    if(response.statusCode==200)
    {
      return resetPasswordModel(response.body);
    }
    else
    {
      throw Exception("Failed");
    }

  }

  Future<dynamic> changePassword(String email,String password) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.29.217:3001/api/auth/change_password");
    var response=await client.post(apiUrl,
    headers: <String,String>{
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
}