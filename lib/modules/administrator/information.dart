import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  Information({super.key});
  final refren = FirebaseDatabase.instance
      .ref('drivers')
      .child('driver_id_1')
      .child('violations');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 40, color: Colors.white),
        backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
        title: const Text(
          'User\'s data',
          style: TextStyle(
            fontSize: 35.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
                child: FirebaseAnimatedList(
              query: refren,
              itemBuilder: (context, snapshot, animation, index) {
                return Card(
                  color: const Color(0xFF8E0C19),
                  child: ListTile(
                      title: Center(
                        child: Text(snapshot.child('type').value.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                      ),
                      subtitle: Text(
                        snapshot.child('time').value.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      trailing: const Icon(Icons.car_crash_outlined,
                          color: Colors.white, size: 40)),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
