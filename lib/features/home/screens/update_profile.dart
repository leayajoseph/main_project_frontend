import 'package:flutter/material.dart';
import 'package:villagezone/features/home/screens/account.dart';
import 'package:villagezone/services/AuthService.dart';

class UpdateProfile extends StatefulWidget {
  final String userid;
  final String email;
  final String name;
  final String phone;
  final String address;
  final String pincode;

  const UpdateProfile({required this.userid,
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    required this.pincode,Key? key}) : super(key: key);



  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _pincodeController;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: widget.email);
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _addressController = TextEditingController(text: widget.address);
    _pincodeController = TextEditingController(text: widget.pincode);
  }

void updateProfile(String userId, String email, String name, String phone, String address, String pincode) async{
  try {
    final response = await UserAuthApiService().updateUserData(userId, email, name, phone, address, pincode);
    if (response.containsKey('message')) {
      print(response['message']);
    } else {
      print('Success: User updated successfully');
    }
  } catch (e) {
    print('Failed: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
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
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [

                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _pincodeController,
                      decoration: InputDecoration(
                        labelText: 'Pincode',
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Retrieve updated values
                        String updatedEmail = _emailController.text.isNotEmpty ? _emailController.text : widget.email;
                        String updatedName = _nameController.text.isNotEmpty ? _nameController.text : widget.name;
                        String updatedPhone = _phoneController.text.isNotEmpty ? _phoneController.text : widget.phone;
                        String updatedAddress = _addressController.text.isNotEmpty ? _addressController.text : widget.address;
                        String updatedPincode = _pincodeController.text.isNotEmpty ? _pincodeController.text : widget.pincode;

                        // Call function to update profile details with updated values
                        updateProfile(widget.userid, updatedEmail, updatedName, updatedPhone, updatedAddress, updatedPincode);

                        // Navigate back to account page

                      },
                      child: Text('Update'),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountPage()));
                        }, child: Text("Back"))

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
