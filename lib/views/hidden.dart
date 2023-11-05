import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/add_contact_provider.dart';
import '../provider/theme_provider.dart';

class contactt extends StatefulWidget {
  const contactt({super.key});

  @override
  State<contactt> createState() => _contacttState();
}

class _contacttState extends State<contactt> {
  @override
  Widget build(BuildContext context) {
    var providertheme = Provider.of<themeProvider>(context, listen: false);
    var res = Provider.of<addcontacatprovider>(context);
    return Scaffold(
      appBar: AppBar(
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
        ],
      ),
      body: ListView.builder(
        itemCount: res.hiddencontact.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("${res.hiddencontact[index].name}"),
              subtitle: Text("${res.hiddencontact[index].phonenumber}"),
              trailing: IconButton(
                onPressed: () {
                  res.deletehiddenlist();
                },
                icon: Icon(Icons.hide_source),
              ),
            ),
          );
        },
      ),
    );
  }
}
