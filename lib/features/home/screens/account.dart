import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:villagezone/models/UserModel.dart';
import 'package:villagezone/services/AuthService.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late UserDetails _userDetails;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  void _fetchUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('securityId') ?? '';

    UserAuthApiService().getUserDetails(userId)
        .then((userDetails) {
      if (userDetails != null) {
        setState(() {
          _userDetails = userDetails;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        // Handle error: no user found
      }
    })
        .catchError((error) {
      setState(() {
        _isLoading = false;
      });
      // Handle error: failed to load user details
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          :SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.teal,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'My Account',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)

                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Text(_userDetails.name[0],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      backgroundColor: Colors.teal.withOpacity(0.5),
                      radius: 30,
                      // You can add image here if available
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 500,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 50,),
                              Text('${_userDetails.name}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Icon(Icons.mail),
                              SizedBox(width: 50,),
                              Text(
                                '${_userDetails.email}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(

                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 50,),
                              Text(
                                '${_userDetails.phone}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Icon(Icons.home),
                              SizedBox(width: 50,),
                              Column( // Display address line by line
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _userDetails.address.split(',').map((line) {
                                  return Row(
                                    children: [
                                      Text(line.trim(), style: TextStyle(fontSize: 18)),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(

                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 50,),
                              Text(
                                '${_userDetails.pincode}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed:(){}, child: Text("Edit Profile")),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed:(){}, child: Text("Logout"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
