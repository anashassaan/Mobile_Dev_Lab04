import 'package:flutter/material.dart';

void main() {
  runApp(CompanyProfile());
}

class CompanyProfile extends StatefulWidget {
  @override
  _CompanyProfileState createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  // Keep track of the form for validation
  final _formKey = GlobalKey<FormState>();

  // Loading Icon
  bool loading = false;

  final AuthService _authService = AuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future getCompanyNameData() async {
    final CollectionReference users =
        _firebaseFirestore.collection("Companies");
    final String uid = _firebaseAuth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()["companyName"];
  }

  Future getCompanyEmailData() async {
    final CollectionReference users =
        _firebaseFirestore.collection("Companies");
    final String uid = _firebaseAuth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()["companyEmail"];
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              title: Text(
                "Create the company profile",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              elevation: 0.0,
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: FutureBuilder(
                      future: getCompanyNameData(),
                      builder: (_, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return Text(snapshot.data);
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      "Log Out",
                    ),
                    onTap: () async {
                      await _authService.signOut();
                    },
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Company name: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            FutureBuilder(
                              future: getCompanyNameData(),
                              builder: (_, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Loading");
                                }
                                return Text(
                                  snapshot.data,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Company email: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            FutureBuilder(
                              future: getCompanyEmailData(),
                              builder: (_, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Loading");
                                }
                                return Text(
                                  snapshot.data,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditCompanyEmailScreen(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Company phone number: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        // Here is where I want to add the image
                        Row(
                          children: <Widget>[],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
