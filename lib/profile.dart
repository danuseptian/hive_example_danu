import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ValueListenableBuilder(
                  valueListenable: Hive.box('myBox').listenable(),
                  builder: (context, box, widget) {
                    var number = box.get('number', defaultValue: 10);
                    return Text('${number}');
                  })),
        ],
      ),
    );
  }
}
