import 'package:advance_tutorial_1_contact_diary/provider/add_contact_provider.dart';
import 'package:advance_tutorial_1_contact_diary/provider/theme_provider.dart';
import 'package:advance_tutorial_1_contact_diary/views/contact_details.dart';
import 'package:advance_tutorial_1_contact_diary/views/hidden.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import 'add.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  data() async {
    await Provider.of<themeProvider>(context, listen: false).getTheme();
  }

  @override
  Widget build(BuildContext context) {
    var providertheme = Provider.of<themeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.white,
          title: const Text(
            "Contact",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  providertheme.changetheme();
                  await providertheme.setTheme();
                },
                icon: const Icon(
                  Icons.circle,
                  color: Colors.black,
                )),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () async {
                final LocalAuthentication auth = LocalAuthentication();
                if (await auth.isDeviceSupported() == true ||
                    auth.canCheckBiometrics == true) {
                  auth
                      .authenticate(
                          localizedReason: "Authenticate for hidden contact")
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => contactt(),
                        ));
                  });
                }
              },
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Add(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: Provider.of<addcontacatprovider>(context).addcontact.isEmpty
          ? const emptyy()
          : const details(),
    );
  }
}

class emptyy extends StatefulWidget {
  const emptyy({Key? key}) : super(key: key);

  @override
  State<emptyy> createState() => _emptyyState();
}

class _emptyyState extends State<emptyy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "images/box.png",
          scale: 5,
        ),
        const Center(
          child: Text(
            "You have no contacts yet",
            style: TextStyle(color: Colors.black54, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    var res = Provider.of<addcontacatprovider>(context);
    var res2 = Provider.of<addcontacatprovider>(context, listen: false);
    return Scaffold(
      body: ListView.builder(
        itemCount: res.addcontact.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetail(index: index),
                  ));
            },
            child: ListTile(
              trailing: InkWell(
                  onTap: () {
                    res2.deletelist();
                  },
                  child: Icon(Icons.hide_source_outlined)),
              title: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("${res.addcontact[index].name}"),
                          SizedBox(
                            width: 6,
                          ),
                          Text("${res.addcontact[index].lastname}"),
                        ],
                      ),
                      Text("${res.addcontact[index].phonenumber}"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
