import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dream.dart';
import 'package:intl/intl.dart';

import 'main.dart';

final dMy = DateFormat('dd/MM/yyyy');

class DreamCard extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const DreamCard({required this.dream});
  final Dream dream;
  //final VoidCallback onDelete;

  @override
  State<DreamCard> createState() => _DreamCardState();
}

class _DreamCardState extends State<DreamCard> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (LongPressDownDetails details) {
        setState(() {
          pressed = true;
        });
      },
      onLongPressCancel: () {
        setState(() {
          pressed = false;
        });
      },
      onLongPress: (() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Delete Dream?'),
              content: const Text(
                  'Are you sure you want to delete this dream? This action cannot be undone'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Delete'),
                  onPressed: () {
                    dreams.remove(widget.dream);
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    setState(() {
                      pressed = false;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }),
      child: Card(
        color: (pressed ? Colors.grey : Colors.white),
        elevation: 15.0,
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  if (widget.dream.lucid == true)
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
                    dMy.format(widget.dream.date),
                    style: TextStyle(
                      color: Colors.blueGrey[600],
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              Text(
                widget.dream.title,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 29, 20, 66),
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                widget.dream.description,
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
                    if (widget.dream.place.toString() != '[null]') ...[
                      WidgetSpan(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.blue[700],
                        ),
                      ),
                      TextSpan(
                        text: widget.dream.place.toString(),
                        style: TextStyle(color: Colors.blue[700]),
                      ),
                    ],
                    if (widget.dream.characters.toString() != '[null]') ...[
                      WidgetSpan(
                          child: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.blue[700],
                      )),
                      TextSpan(
                        text: widget.dream.characters.toString(),
                        style: TextStyle(color: Colors.blue[700]),
                      ),
                    ],
                    if (widget.dream.theme.toString() != '[null]') ...[
                      WidgetSpan(
                          child: Icon(
                        Icons.extension_outlined,
                        color: Colors.blue[700],
                      )),
                      TextSpan(
                        text: widget.dream.theme.toString(),
                        style: TextStyle(color: Colors.blue[700]),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
