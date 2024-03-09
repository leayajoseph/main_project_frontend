import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: 'new password',
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
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_reset_outlined),
                      hintText: 'confirm password',
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
              SizedBox(height: 30,),
              SizedBox(
                width: 200,
                child: ElevatedButton(onPressed:()
                {

                }, child: Text("Continue"),
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
