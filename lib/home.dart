import 'package:flutter/material.dart';
import 'package:hive_danu/profile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: Hive.box('myBox').listenable(),
                builder: (context, box, widget) {
                  var darkMode = box.get('darkMode', defaultValue: false);
                  var number = box.get('number', defaultValue: 10);
                  return Column(
                    children: [
                      Switch(
                        value: darkMode,
                        onChanged: (val) {
                          box.put('darkMode', !darkMode);
                        },
                      ),
                      Text("$number"),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () {
                          box.put('number', 12);
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  );
                }),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileView(),
                  ),
                );
              },
              child: const Text("Next Page"),
            ),
          ],
        ),
      ),
    );
  }
}
