import 'package:flutter/material.dart';
import 'dream.dart';
import 'package:intl/intl.dart';

final dMy = DateFormat('dd/MM/yyyy');

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                if (dream.lucid == true)
                  Row(
                    children: const [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.teal,
                      ),
                      Text(
                        ' Lucid',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: const [
                      Icon(
                        Icons.run_circle_outlined,
                        color: Colors.pink,
                      ),
                      Text(
                        ' Not Lucid',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                const Spacer(),
                Text(
                  dMy.format(dream.date),
                  style: TextStyle(
                    color: Colors.blueGrey[600],
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
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
            const SizedBox(height: 5.0),
/*            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                      child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue[700],
                  ),),
                  TextSpan(
                      text: dream.place.toString(),
                      style: TextStyle(color: Colors.blue[700]),),
                ],
              ),
            ),
*/
            const SizedBox(height: 5.0),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue[700],
                    ),
                  ),
                  TextSpan(
                    text: dream.place.toString(),
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                  WidgetSpan(
                      child: Icon(
                    Icons.person_outline,
                    color: Colors.blue[700],
                  )),
                  TextSpan(
                      text: dream.characters.toString(),
                      style: TextStyle(color: Colors.blue[700])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
