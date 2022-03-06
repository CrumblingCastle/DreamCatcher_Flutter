import 'package:flutter/material.dart';
import 'dream.dart';
import 'package:intl/intl.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat.yMMMd().format(dream.date),
              style: TextStyle(
                color: Colors.blueGrey[600],
                fontSize: 18.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dream.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 29, 20, 66),
                  ),
                ),
                if (dream.lucid == true)
                  Row(
                    children: const [
                      Text(
                        'Lucid ',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                        ),
                      ),
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.teal,
                      ),
                    ],
                  )
                else
                  Row(
                    children: const [
                      Text(
                        'Not Lucid ',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.pink,
                        ),
                      ),
                      Icon(
                        Icons.run_circle_outlined,
                        color: Colors.pink,
                      ),
                    ],
                  )
              ],
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
