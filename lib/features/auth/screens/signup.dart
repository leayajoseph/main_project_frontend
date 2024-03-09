import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:villagezone/features/auth/screens/auth_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              SvgPicture.asset("assets/img1.svg",height: 200,width: 200,),
              SizedBox(height: 10,),
              Text("Signup",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 10,),
              SizedBox(
                width: 400,
                child: TextField(
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
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                      hintText: 'password',
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
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      hintText: 'name',
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
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      hintText: 'phone',
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
                      prefixIcon: Icon(Icons.home),
                      border: OutlineInputBorder(),
                      hintText: 'address',
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
                      prefixIcon: Icon(Icons.location_on_outlined),
                      border: OutlineInputBorder(),
                      hintText: 'pincode',
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
              SizedBox(height: 20,),
              GestureDetector(
                child: Text("Already have an account? login"),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
