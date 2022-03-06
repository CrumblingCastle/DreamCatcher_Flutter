import 'package:flutter/material.dart';
import 'dream.dart';

class DreamCard extends StatelessWidget {
//  const DreamCard({
//    Key? key,
//  }) : super(key: key);

  final Dream dream;
  // ignore: use_key_in_widget_constructors
  const DreamCard({required this.dream});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15.0,
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              dream.title,
              style: const TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 29, 20, 66),
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              dream.description,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
