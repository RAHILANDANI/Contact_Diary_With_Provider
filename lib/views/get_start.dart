import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getstart extends StatelessWidget {
  const getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterLogo(
              size: 150,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 3)),
              child: InkWell(
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setBool('isStart', true);
                  Navigator.of(context).pushNamed('homepage');
                },
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
