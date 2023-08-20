import 'package:abuse/features/screens/auth/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/profilitem.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final store = FirebaseFirestore.instance
      .collection('users')
      .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: store,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("error");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Image(
                            width: 300,
                            height: 200,
                            image: AssetImage('assets/png/profile.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ProfileItems(
                          text: snapshot.data!.docs[index].get('name'),
                          iconData: Iconsax.profile_add,
                          icons: const SizedBox(),
                          voidCallback: () {},
                        ),
                        ProfileItems(
                          text: snapshot.data!.docs[index].get('id'),
                          iconData: Icons.recent_actors_outlined,
                          icons: const SizedBox(),
                          voidCallback: () {},
                        ),
                        ProfileItems(
                          text: snapshot.data!.docs[index].get('email'),
                          iconData: Iconsax.message,
                          icons: const SizedBox(),
                          voidCallback: () {},
                        ),
                        ProfileItems(
                          text: '456hg788',
                          iconData: Iconsax.lock,
                          icons: const SizedBox(),
                          voidCallback: () {},
                        ),
                        // ProfileItems(
                        //   text: 'LogOut',
                        //   iconData: Icons.logout_outlined,
                        //   icons: const SizedBox(),
                        //   voidCallback: () {
                        //     FirebaseAuth.instance.signOut();
                        //   },
                        // ),
                        // Spacer(),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (index) => Login()));
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Iconsax.logout,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
