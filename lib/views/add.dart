import 'package:advance_tutorial_1_contact_diary/provider/add_contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String name = '';
  String mail = '';
  String phonenumber = '';
  String lastname = '';

  @override
  Widget build(BuildContext context) {
    var res = Provider.of<addcontacatprovider>(context);
    var providertheme = Provider.of<themeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add",
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          //Icon(Icons.done, color: Colors.black),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () async {
                providertheme.changetheme();
                await providertheme.setTheme();
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: res.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "First Name",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    hintText: "Rahil",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter the first name";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    name = val;
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "Last Name",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    hintText: "Andani",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter the Last name";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    lastname = val;
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      hintText: "9228820333",
                      prefixText: "+91"),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter 10 digit mobile number";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    phonenumber = val;
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    hintText: "rahilandani786@gmail.com",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter the mail";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    mail = val;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<addcontacatprovider>(context, listen: false)
                          .addContact(name, lastname, mail, phonenumber);
                      Navigator.pop(context);
                    },
                    child: const Text("SAVE"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
