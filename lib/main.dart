import 'package:flutter/material.dart';
import 'dream.dart';
import 'dateToIndex.dart';
import 'dream_card.dart';
import 'stat_info_reminder_settings.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:after_layout/after_layout.dart';

void main() => runApp(MaterialApp(
      // ignore: prefer_const_constructors
      home: const Home(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    ));

// list of dreams - global
List<Dream> dreams = [
  Dream(
    title: 'Walk in Park',
    description: 'I was walking in a park and a dragon attacked me.',
    lucid: false,
    date: DateTime(2022, 03, 04),
    characters: ['dragon'],
    place: 'park',
  ),
  Dream(
    title: 'Climbing Accident',
    description:
        'I was climbing on a steep rock and another dragon attacked me.',
    lucid: false,
    date: DateTime(2022, 03, 05),
    characters: ['dragon', 'coach Victor'],
  ),
  Dream(
    title: 'Dragon attack',
    description:
        'I was getting attacked by a dragon and all of sudden another dragon attacked me.. these dragons are getting out of hand imo.',
    lucid: true,
    date: DateTime(2022, 03, 06),
  ),
  Dream(
    title: 'Awaiting for this bloke to come',
    description:
        'Well, tonight i was just playing table tenis, waiting for the dragon. He never came :( im sad.',
    lucid: true,
    date: DateTime(2022, 03, 07),
    characters: ['maimos'],
    place: 'ypogeio lolas',
  ),
  Dream(
    title: 'Life is meaningless',
    description:
        'I was getting angry with these dragons.. but now, now i see. I finally realise they were my only real friends.',
    lucid: false,
    date: DateTime(2022, 03, 08),
  ),
  Dream(
    title: 'Dragon attack mothafackas',
    description:
        'WHAT A FIGHT! Dragon is back when nobody expected him. I was chilling in the park and BAM! Dragon. We had a nice fight, then saluted eachother and went on with our days',
    lucid: true,
    date: DateTime(2022, 03, 09),
    characters: ['dragon'],
  ),
  Dream(
    title: 'Lunch with dragon',
    description:
        'Tonight we were not in the mood to fight. Dragon came but we just decided to grab a sandwich instead.',
    lucid: true,
    date: DateTime(2022, 03, 10),
    characters: ['dragon'],
  ),
  Dream(
    title:
        'Everybody asks what is dragon doing, but noone ever asks how is dragon doing',
    description:
        'I am getting to know my buddy dragon and he seems like a top bloke. It had never come to my attention how opressed dragon are in todays neo-feudalistic societies.',
    lucid: true,
    date: DateTime(2022, 03, 11),
    characters: ['dragon'],
  ),
  Dream(
    title:
        'Everybody asks what is dragon doing, but noone ever asks how is dragon doing',
    description:
        'I am getting to know my buddy dragon and he seems like a top bloke. It had never come to my attention how opressed dragon are in todays neo-feudalistic societies.',
    lucid: true,
    date: DateTime(2022, 03, 11),
    characters: ['dragon'],
  ),
  Dream(
    title:
        'Everybody asks what is dragon doing, but noone ever asks how is dragon doing',
    description:
        'I am getting to know my buddy dragon and he seems like a top bloke. It had never come to my attention how opressed dragon are in todays neo-feudalistic societies.',
    lucid: true,
    date: DateTime(2022, 03, 11),
    characters: ['dragon'],
  ),
  Dream(
    title:
        'Everybody asks what is dragon doing, but noone ever asks how is dragon doing',
    description:
        'I am getting to know my buddy dragon and he seems like a top bloke. It had never come to my attention how opressed dragon are in todays neo-feudalistic societies.',
    lucid: true,
    date: DateTime(2022, 03, 11),
    characters: ['dragon'],
  ),
  Dream(
    title: 'Awaiting for this bloke to come',
    description:
        'Well, tonight i was just playing table tenis, waiting for the dragon. He never came :( im sad.',
    lucid: true,
    date: DateTime(2022, 03, 12),
    characters: ['maimos'],
  ),
  Dream(
    title: 'Awaiting for this bloke to come',
    description:
        'Well, tonight i was just playing table tenis, waiting for the dragon. He never came :( im sad.',
    lucid: true,
    date: DateTime(2022, 03, 13),
    characters: ['maimos'],
  ),
  Dream(
    title: 'Awaiting for this bloke to come',
    description:
        'Well, tonight i was just playing table tenis, waiting for the dragon. He never came :( im sad.',
    lucid: true,
    date: DateTime(2022, 03, 14),
    characters: ['maimos'],
  ),
  Dream(
    title: 'Awaiting for this bloke to come',
    description:
        'Well, tonight i was just playing table tenis, waiting for the dragon. He never came :( im sad.',
    lucid: true,
    date: DateTime(2022, 03, 17),
    characters: ['maimos'],
  ),
  Dream(
    title: 'Awaiting for this bloke to come',
    description:
        'Well, tonight i was just playing table tenis, waiting for the dragon. He never came :( im sad.',
    lucid: true,
    date: DateTime(2022, 03, 20),
    characters: ['maimos'],
  ),
  Dream(
    title: 'Awaiting for this bloke to come',
    description:
        'Well, tonight i was just playing table tenis, waiting for the dragon. He never came :( im sad.',
    lucid: true,
    date: DateTime(2022, 03, 27),
    characters: ['maimos'],
  ),
];

// date we picked - global
DateTime selectedDate = DateTime.now();
int selectedDateIndex = 0;

// ~~~~~~~~~~~~| Home Page |~~~~~~~~~~~~

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        elevation: 0.5,
        toolbarHeight: 100.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 29, 20, 66),
        title: Column(
          children: [
            Text(
              "Dream Catcher",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w600,
                shadows: const <Shadow>[
                  Shadow(
                    offset: Offset(-1.0, 3.0),
                    blurRadius: 4.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Shadow(
                    offset: Offset(3.0, -1.0),
                    blurRadius: 2.0,
                    color: Color.fromARGB(125, 0, 0, 255),
                  ),
                ],
                fontFamily: 'Lobster',
                wordSpacing: 8.0,
                letterSpacing: 2.0,
                color: Colors.deepPurple[400],
              ),
            ),
            const Text(
              "Captivate your dreams",
              style: TextStyle(
                fontSize: 20.0,
                //fontFamily: 'Some Font Family'
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2022, 1, 1),
            lastDate: DateTime.now().add(const Duration(days: 1825)),
            onDateChanged: (DateTime date) {
              selectedDateIndex = dateToIndex(date);
              selectedDate = date;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DreamList(),
                ),
              );
            },
          ),
          const Text('(tap on a date to see or add dreams)'),
          Row(
            // stats & info buttons
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StatPage(),
                        ),
                      );
                    },
                    label: const Text('Achievements\n& Statistics'),
                    icon: const Icon(Icons.auto_graph),
                    style:
                        ElevatedButton.styleFrom(fixedSize: const Size(1, 80)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const InfoPage(),
                        ),
                      );
                    },
                    label: const Text('Dream Theory'),
                    icon: const Icon(Icons.info_outline),
                    style:
                        ElevatedButton.styleFrom(fixedSize: const Size(1, 80)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SetReminder(),
                  ),
                );
              },
              icon: const Icon(Icons.alarm_outlined),
              color: Colors.deepPurple[800],
              //color: const Color.fromARGB(255, 29, 20, 66),
              iconSize: 40.0,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Settings(),
                  ),
                );
              },
              icon: const Icon(Icons.settings_outlined),
              color: Colors.deepPurple[800],
              //color: const Color.fromARGB(255, 29, 20, 66),
              iconSize: 45.0,
            ),
          ],
        ),
      ),
    );
  }
}

// ~~~~~~~~~~~~| Dreams Page |~~~~~~~~~~~~

class DreamList extends StatefulWidget {
  const DreamList({Key? key}) : super(key: key);

  @override
  State<DreamList> createState() => _DreamListState();
}

class _DreamListState extends State<DreamList>
    with AfterLayoutMixin<DreamList> {
  final ItemScrollController itemController = ItemScrollController();

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        scrollToItem(selectedDateIndex);
      },
    );
  }

  Dream newDream = Dream(date: selectedDate);
  void updateInformation(Dream information) {
    setState(() {
      newDream = information;
      dreams.insert(dateToInsertIndex(selectedDate), newDream);
    });
  }

  void moveToSecondPage() async {
    final information = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) => const AddDream()),
    );
    updateInformation(information);
  }

  Future scrollToItem(int index) async {
    itemController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 1300),
      curve: Curves.easeInOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 29, 20, 66),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 29, 20, 66)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                child: Text(
                    'index: $selectedDateIndex\n ${dMy.format(selectedDate)}'),
                onPressed: () {
                  scrollToItem(selectedDateIndex);
                },
              ),
              const SizedBox(width: 30.0),
              const Text(
                'ADD DREAM',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 20, 66),
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12.0),
              FloatingActionButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => const AddDream(),
                  //   ),
                  // );
                  moveToSecondPage();
                },
                mini: true,
                elevation: 10.0,
                backgroundColor: Colors.deepPurple[200],
                child: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 29, 20, 66),
                ),
              ),
              const SizedBox(width: 15.0),
            ],
          ),
        ],
      ),
      body: ScrollablePositionedList.builder(
        itemCount: dreams.length,
        itemBuilder: (context, index) {
          return DreamCard(dream: dreams[index]);
        },
        itemScrollController: itemController,
        //itemPositionsListener: ItemPositionsListener(),
        //  children: dreams.map((dream) => DreamCard(dream: dream)).toList(),
      ),
    );
  }
}

// ~~~~~~~~~~~~| Add Dream |~~~~~~~~~~~~

class AddDream extends StatefulWidget {
  const AddDream({Key? key}) : super(key: key);

  @override
  State<AddDream> createState() => _AddDreamState();
}

class _AddDreamState extends State<AddDream> {
  bool _lucid = false;
  bool? lucid = false;
  dynamic _title;
  dynamic _description;
  Dream dreamy = Dream(date: selectedDate);
  final titleCon = TextEditingController();
  final descCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text('Add Dream on ${dMy.format(selectedDate)}'),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 29, 20, 66),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(
            MaterialPageRoute(
              builder: (context) => const DreamList(),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              const SizedBox(width: 18.0),
              const Text('Lucid'),
              Checkbox(
                value: lucid,
                onChanged: (value) {
                  setState(() {
                    lucid = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                child: const Text('SAVE DREAM'),
                onPressed: () {
                  setState(() {
                    _title = titleCon.text;
                    _description = descCon.text;
                    _lucid = lucid!;
                    dreamy.characters = ['dragon'];
                    dreamy.title = _title;
                    dreamy.description = _description;
                    dreamy.lucid = _lucid;
                    dreamy.date = selectedDate;
                  });
                  // Navigator.of(context).pop(
                  //     MaterialPageRoute(
                  //       builder: (context) => const DreamList(),
                  //     ));
                  Navigator.pop(context, dreamy);
                },
              ),
              const SizedBox(width: 18.0)
            ],
          ),
          // ~~~~~~~~~~ TITLE TEXT-BOX
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              controller: titleCon,
              decoration: InputDecoration(
                  hintText: "Input text |",
                  labelText: "Title",
                  labelStyle:
                      const TextStyle(fontSize: 16, color: Colors.deepPurple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  filled: true),
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 10.0),
          // ~~~~~~~~~~ DESCRIPTION TEXT-BOX + icon buttons
          Flexible(
            child: Container(
              margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              child: TextField(
                expands: true,
                maxLines: null,
                controller: descCon,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                    hintText: "Input text |",
                    alignLabelWithHint: true,
                    label:
                        const Text('Description', textAlign: TextAlign.start),
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // added line
                      // mainAxisSize: MainAxisSize.min,
                      // added line
                      children: <Widget>[
                        const SizedBox(height: 10.0),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.photo_camera_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.create_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.account_circle_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.location_on_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.extension_outlined),
                        ),
                      ],
                    ),
                    fillColor: Colors.white,
                    filled: true),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
