import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../fetch_UserDetailsAPI/fetch_userdata_api.dart';
import '../seleted_tapped_provider/provider_data.dart';
import 'func/userData_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "User Fetched Data",
          ),
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder<List<UserDetails>>(
          future: fetchUserData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<UserDetails>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error:${snapshot.error}"),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text("No Data found"),
              );
            } else {
              List<UserDetails> userDetails = snapshot.data!;
              return RefreshIndicator(
                onRefresh: () async {
                  await fetchUserData().then((updatedData) {
                    setState(() {
                      userDetails = updatedData;
                    });
                  });
                },
                child: ChangeNotifierProvider(
                  create: (BuildContext context) {
                    return SelectedUser();
                  },
                  child: UserDataTile(
                      userDetails: userDetails,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),
                ),
              );
            }
          },
        ));
  }
}
