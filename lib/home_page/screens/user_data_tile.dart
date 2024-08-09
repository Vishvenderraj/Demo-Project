import 'package:flutter/material.dart';
import 'package:project/home_page/screens/user_detailed_info.dart';
import 'package:provider/provider.dart';
import '../func/fetch_UserDetailsAPI/fetch_userdata_api.dart';
import '../func/tapped_provider/provider_data.dart';

class UserDataTile extends StatelessWidget {
  const UserDataTile({
    super.key,
    required this.userDetails,
    required this.screenWidth,
    required this.screenHeight,
  });

  final List<UserDetails> userDetails;
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: userDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.012,
                      vertical: screenHeight * 0.011),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300),
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.022)),
                    title: Padding(
                      padding: EdgeInsets.all(screenHeight * 0.007),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userDetails[index].username,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, letterSpacing: 1),
                          ),
                          SizedBox(
                            height: screenHeight * 0.006,
                          ),
                          Text(
                            userDetails[index].email,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (BuildContext context) {
                              return Tapped(false);
                            },
                            child: UserDataDetails(
                              userName: userDetails[index].username,
                              name: userDetails[index].name,
                              email: userDetails[index].email,
                              phoneNumber: userDetails[index].phone,
                              website: userDetails[index].website,
                              street: userDetails[index].street,
                              suite: userDetails[index].suite,
                              city: userDetails[index].city,
                              zipCode: userDetails[index].zipcode,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        )
      ],
    );
  }
}
