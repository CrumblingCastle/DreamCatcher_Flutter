import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

// ~~~~~~~~~~~~| Stat Page |~~~~~~~~~~~~

List<String> ranks = [
  'Dream Tripper',
  'Dreamonaut',
  'Dream Guru',
  'Dream Cruiser',
  'Dream Freak',
  'Basically losing sense of reality'
];

class StatPage extends StatefulWidget {
  const StatPage({Key? key}) : super(key: key);

  @override
  State<StatPage> createState() => _StatPageState();
}

bools() {
  var lucidLens = 0;
  for (var i = 0; i < dreams.length; i++) {
    if (dreams[i].lucid == true) lucidLens++;
  }
  return lucidLens;
}

class DreamRank {
  String myrank;
  String mynext;
  int myleft;

  DreamRank({
    required this.myrank,
    required this.myleft,
    required this.mynext,
  });
}

DreamRank myRank =
    DreamRank(myleft: 30 - dreams.length, myrank: ranks[0], mynext: ranks[1]);

class LucidData {
  LucidData(this.lucidity, this.percent);
  final String lucidity;
  final num percent;
}

class _StatPageState extends State<StatPage> {
  var len = dreams.length;
  var lucidLen = bools();
  num perLucid =
      num.parse(((bools() / dreams.length) * 100).toStringAsFixed(2));
  num perNotLucid =
      num.parse(((1 - bools() / dreams.length) * 100).toStringAsFixed(2));
  final _rank = myRank.myrank;
  final _left = myRank.myleft;
  final _next = myRank.mynext;

  ranking() {
    if (dreams.length < 20) {
      myRank.myrank = ranks[0];
      myRank.myleft = 20 - dreams.length;
      myRank.mynext = ranks[1];
    } else if (dreams.length >= 20 && dreams.length < 50) {
      myRank.myrank = ranks[1];
      myRank.myleft = 50 - dreams.length;
      myRank.mynext = ranks[2];
    } else if (dreams.length >= 50 && dreams.length < 80) {
      myRank.myrank = ranks[2];
      myRank.myleft = 80 - dreams.length;
      myRank.mynext = ranks[3];
    } else if (dreams.length >= 80 && dreams.length < 110) {
      myRank.myrank = ranks[3];
      myRank.myleft = 110 - dreams.length;
      myRank.mynext = ranks[4];
    } else if (dreams.length >= 110 && dreams.length < 140) {
      myRank.myrank = ranks[4];
      myRank.myleft = 140 - dreams.length;
      myRank.mynext = ranks[5];
    } else if (dreams.length >= 140) {
      myRank.myrank = ranks[5];
      myRank.myleft = 0;
      myRank.mynext = ranks[5];
    }
  }

  void getLen() {
    setState(() {
      len = dreams.length;
      lucidLen = bools();
      ranking();
      perLucid = lucidLen / len;
      perNotLucid = 1 - lucidLen / len;
    });
  }

  late List<LucidData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Achievements & Statistics'),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 29, 20, 66),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 29, 20, 66)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Well done! Your rank is:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 29, 20, 66),
                      fontSize: 16.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _rank,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 29, 20, 66),
                      fontSize: 24.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'You have $_left dreams left until you become $_next',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 29, 20, 66),
                      fontSize: 16.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SfCircularChart(
                        legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap),
                        series: <CircularSeries>[
                          PieSeries<LucidData, String>(
                              dataSource: _chartData,
                              xValueMapper: (LucidData data, _) =>
                                  data.lucidity,
                              yValueMapper: (LucidData data, _) => data.percent,
                              dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  alignment: ChartAlignment.center))
                        ]),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Total Number of Dreams:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 29, 20, 66),
                          fontSize: 9.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '$len',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 29, 20, 66),
                          fontSize: 60.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 20.0),
                  //margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        '..out of them, Lucid:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 29, 20, 66),
                          fontSize: 9.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '$lucidLen',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 29, 20, 66),
                          fontSize: 60.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ], //children
          ),
        ], //Children
      ),
    );
  }

  List<LucidData> getChartData() {
    final List<LucidData> chartData = [
      LucidData('Lucid %', perLucid),
      LucidData('Not Lucid %', perNotLucid),
    ];
    return chartData;
  }
}

// ~~~~~~~~~~~~| Info Page |~~~~~~~~~~~~

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: const Text('Dream Theory'),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromARGB(255, 29, 20, 66),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Color.fromARGB(255, 29, 20, 66)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: const Text(
                "Acquiring the ability to interpret your dreams is a powerful tool. In analyzing your dreams, you can learn about your deep secrets and hidden feelings. Remember that no one is a better expert at interpreting your dreams than yourself.  ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 20, 66),
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 230,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(11)),
              child: const TextButton(
                onPressed: _launchURL,
                child: Text(
                  'Dream Dictionary',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ],
        )));
  }
}

_launchURL() async {
  const url = 'https://www.dreamdictionary.org';
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

// ~~~~~~~~~~~~| Set Reminder |~~~~~~~~~~~~

class SetReminder extends StatefulWidget {
  const SetReminder({Key? key}) : super(key: key);

  @override
  State<SetReminder> createState() => _SetReminderState();
}

class _SetReminderState extends State<SetReminder> {
  get hourController => null;

  get minuteController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: const Text('Set Reminder'),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromARGB(255, 29, 20, 66),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Color.fromARGB(255, 29, 20, 66)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Column(children: <Widget>[
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: const Text(
                'We recomend you write down your dream right when you wake up. '
                'That\'s  when it\'s easier to remember them. '
                'However, you can set an alarm during any time of the day to remind you to submit your dreams.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 20, 66),
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 40.0,
                          //height: 2.0,
                          color: Colors.deepPurple),
                      controller: hourController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Container(
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 40.0,
                          //height: 2.0,
                          color: Colors.deepPurple),
                      controller: minuteController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 230,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(11)),
              child: TextButton(
                child: const Text(
                  'Create alarm',
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
                onPressed: () {
                  int hour;
                  int minutes;
                  hour = int.parse(hourController.text);
                  minutes = int.parse(minuteController.text);
                  FlutterAlarmClock.createAlarm(hour, minutes,
                      title: 'Don\'t forget to write down your dreams today');
                },
              ),
            ),
          ]),
        ));
  }
}

// ~~~~~~~~~~~~| Settings |~~~~~~~~~~~~

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 29, 20, 66),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 29, 20, 66)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
