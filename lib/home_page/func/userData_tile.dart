import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../fetch_UserDetailsAPI/fetch_userdata_api.dart';
import '../../seleted_tapped_provider/provider_data.dart';

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
    return Consumer<SelectedUser>(
      builder: (BuildContext context, selectedUserProvider,child) =>
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: userDetails.length,
                    itemBuilder: (BuildContext context, int index)
                    {
                      bool selected = selectedUserProvider.selectedUserId == userDetails[index].id;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth*0.012,vertical: screenHeight*0.011),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color:
                              selected?Colors.red.shade200:Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          title: Padding(
                            padding: EdgeInsets.all(screenHeight*0.007),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userDetails[index].username,style: const TextStyle(fontWeight: FontWeight.w700,letterSpacing: 1),),
                                SizedBox(height: screenHeight*0.006,),
                                Text(userDetails[index].email,style: const TextStyle(fontWeight: FontWeight.w300,letterSpacing: 1),),
                                selected?Text(userDetails[index].name,style: const TextStyle(fontWeight: FontWeight.w300,letterSpacing: 1),):const SizedBox(),
                                selected?Text(userDetails[index].phone,style: const TextStyle(fontWeight: FontWeight.w300,letterSpacing: 1),):const SizedBox(),
                                selected?Text(userDetails[index].website,style: const TextStyle(fontWeight: FontWeight.w300,letterSpacing: 1),):const SizedBox(),
                              ],
                            ),
                          ),
                          leading:CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            child: const Icon(Icons.person,color: Colors.white,),),
                          onTap: (){
                            if (selectedUserProvider.selectedUserId == userDetails[index].id) {
                              selectedUserProvider.resetUser();
                            } else {
                              selectedUserProvider.selectUser(userDetails[index].id);
                            }
                          },
                        ),
                      );
                    }
                ),
              )
            ],
          ),
    );
  }
}
