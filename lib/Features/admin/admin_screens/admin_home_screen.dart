import 'package:bookly/core/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/strings.dart';
import 'admin_books.dart';


FirebaseFirestore _fireStore = FirebaseFirestore.instance;

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  List<bool> activationStates = [];

  @override
  void initState() {
    super.initState();
    _initializeActivationStates();
  }

  Future<void> _initializeActivationStates() async {
    QuerySnapshot querySnapshot = await _fireStore.collection('users').get();
    setState(() {
      activationStates = querySnapshot.docs
          .map<bool>((doc) => doc['isActivated'] ?? false)
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'All Users',
            style: TextStyle(
                color: Color(0xfffbf4ea),
                fontWeight: FontWeight.bold,
                fontSize: 32),
          ),
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, addNewBook);
                },
                icon: const Icon(
                  Icons.add,
                  size: 32,
                  color: Color(0xfffbf4ea),
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminBooks(),
                      ));
                },
                icon: const Icon(
                  Icons.menu_book,
                  size: 32,
                  color: Color(0xfffbf4ea),
                )),
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, loginScreen);
                },
                icon: const Icon(
                  Icons.logout,
                  size: 32,
                  color: Color(0xfffbf4ea),
                )),
            const SizedBox(
              width: 12,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text("No Users Found"),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Something Went Wrong"),
                        );
                      }
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;

                          return Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xfffbf4ea),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 230,
                                  child: ListTile(
                                    title: Text(
                                      data['userName'],
                                      style: const TextStyle(
                                          color: kPrimaryColor, fontSize: 24),
                                    ),
                                    subtitle: Text(data['eMail']),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          return activationStates[index]
                                              ? Colors.green
                                              : Colors.blue;
                                        },
                                      ),
                                    ),
                                    onPressed: () {
                                      _activateAccount(document.id, index);
                                    },
                                    child: Text(
                                      activationStates[index]
                                          ? 'Activated'
                                          : 'Activate',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _activateAccount(String userId, int index) async {
    try {
      await _fireStore
          .collection('users')
          .doc(userId)
          .update({'isActivated': true});
      setState(() {
        activationStates[index] = true;
      });
    } catch (e) {
    }
  }
}
