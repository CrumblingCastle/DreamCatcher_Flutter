import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class DrawPage extends StatefulWidget {
  const DrawPage({Key? key}) : super(key: key);

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  late SignatureController controller;
  late Image drawing;

  @override
  void initState() {
    super.initState();
    controller = SignatureController(
      penColor: Colors.deepPurple[900]!,
      penStrokeWidth: 7.0,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Signature(
            controller: controller,
            backgroundColor: Colors.deepPurple[100]!,
          ),
        ),
        Container(
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (controller.isNotEmpty) {
                    // controller.toImage(drawing);
                  }
                  Navigator.pop(context, drawing);
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () => controller.clear(),
                icon: const Icon(Icons.clear, color: Colors.red),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
