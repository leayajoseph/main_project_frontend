import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:villagezone/features/auth/screens/reset_password.dart';
import 'package:villagezone/services/reset_password_service.dart';

class Verification extends StatefulWidget {
  final String? email;
  final String? otpHash;
  const Verification({super.key, this.email, this.otpHash});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

  TextEditingController ob1=new TextEditingController();
  void otp_verify()async{
    final response=await ResetPasswordApiServce().verifyOtp(widget.email!, widget.otpHash!, ob1.text);
    if(response.data!=null)
      {
        Navigator.push(context, MaterialPageRoute(builder:(context)=>ResetPassword(
          email:widget.email,
        )));
      }
    else
      {
        print("Invalid otp");
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
              SizedBox(
                width: 400,
                child: TextField(
                  controller: ob1,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.verified_outlined),
                      hintText: 'verification code',
                      border: OutlineInputBorder(),
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
              SizedBox(
                width: 200,
                child: ElevatedButton(onPressed:otp_verify, child: Text("Continue"),
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
