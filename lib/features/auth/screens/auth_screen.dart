import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:villagezone/features/auth/screens/forgetpassword.dart';
import 'package:villagezone/features/auth/screens/signup.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName='/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/img1.svg",width: 300,height: 300, alignment: Alignment.center,),
            SizedBox(height: 10,),
            Text("Login",style: TextStyle(
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
            SizedBox(height: 20,),
            SizedBox(
              width: 400,
              child: TextField(
                obscureText: true,
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
            SizedBox(height: 20,),
            GestureDetector(
              child: Text("Forget password?"),
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ForgetPassword()));
              },
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
              child: Text("Dont have an account? signup"),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              },
            )

          ],
        ),
      ),
    );
  }
}
