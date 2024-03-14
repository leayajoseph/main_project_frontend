import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:villagezone/features/auth/screens/verification.dart';
import 'package:villagezone/services/reset_password_service.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email='';
  bool isApiCallProcess=false;
  TextEditingController ob1=new TextEditingController();
  void otp_email()async{
    final response=await ResetPasswordApiServce().otpLogin(ob1.text);
    if(response.data!=null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Verification(
          otpHash: response.data,
        email: ob1.text)));
      }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/img2.svg",height: 300,width: 300,alignment: Alignment.center,),
              SizedBox(height: 10,),
              Text("Enter email id",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 10,),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: ob1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                      hintText: 'email',
                      labelText: '',
                      fillColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("We'll send a verification code to this email"),
              SizedBox(height: 30,),
              SizedBox(
                width: 200,
                child: ElevatedButton(onPressed:otp_email,
                  child: Text("Continue"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )

                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
