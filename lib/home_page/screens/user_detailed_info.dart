import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../func/tapped_provider/provider_data.dart';
class UserDataDetails extends StatelessWidget {
  const UserDataDetails({super.key, 
    required this.userName, 
    required this.name,
    required this.email,
    required this.phoneNumber, 
    required this.website, 
    required this.street,
    required this.suite, 
    required this.city, 
    required this.zipCode});
  final String userName;
  final String name;
  final String email;
  final String phoneNumber;
  final String website;
  final String street;
  final String suite;
  final String city;
  final String zipCode;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "UserSelected : $userName", style: TextStyle(
              letterSpacing: 2,
          wordSpacing: 1,
          fontSize: screenHeight*0.022
          ),),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenHeight*0.03),
          child: GestureDetector(
            onTap: (){
              Provider.of<Tapped>(context,listen: false).isTapped();
            },
            child: Material(
              elevation: Provider.of<Tapped>(context).tapped?5:1,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Provider.of<Tapped>(context).tapped?Colors.red.shade200:Colors.grey.shade300,),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(screenHeight*0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Username: $userName', style: TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 1,
                          fontSize: screenHeight*0.019
                      ),),
                      SizedBox(height: screenHeight*0.012),
                      Text('Email: $email', style: TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 1,
                          fontSize: screenHeight*0.019
                      ),),
                      SizedBox(height: screenHeight*0.012),
                      Text('Phone: $phoneNumber', style: TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 1,
                          fontSize: screenHeight*0.019
                      ),),
                      SizedBox(height: screenHeight*0.012),
                      Text('Website: $website', style:TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 1,
                          fontSize: screenHeight*0.019
                      ),),
                      SizedBox(height: screenHeight*0.012),
                      Text('Address: ${'$street $suite $city $zipCode'}', style: TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 1,
                          fontSize: screenHeight*0.019
                      ),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
