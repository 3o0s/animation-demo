import 'package:flutter/material.dart';

List<Widget> tabList = [
  Container(
    width: 30,
    height: 50,
    alignment: Alignment.center,
    child: const Icon(
      Icons.camera_alt,
    ),
  ),
  Container(
      height: 50,
      alignment: Alignment.center,
      child: const Text(
        "CHATS",
      )),
  Container(
      height: 50,
      alignment: Alignment.center,
      child: const Text(
        "STATUS",
      )),
  Container(
      height: 50,
      alignment: Alignment.center,
      child: const Text(
        "CALL",
      ))
];

class WhatsApp extends StatefulWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  double button = 25;
  double right = 25;
  final Color _color = const Color(0xFF25D366);
  IconData floatingActionIcon = Icons.message;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double yourWidth = width / 5;

    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Stack(
        children: [
          Scaffold(
            body: const TabBarView(
              children: [
                Icon(Icons.camera_alt),
                Text('Messages'),
                Text('Status'),
                Text('Calls'),
              ],
            ),
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.grey,
                  ),
                ),
              ],
              title: Text(
                'WhatsApp',
                style: TextStyle(color: Colors.grey[600]),
              ),
              backgroundColor: Colors.grey[900],
              bottom: TabBar(
                indicatorColor: _color,
                onTap: (value) {
                  setState(() {
                    if (value == 1) {
                      button = 25;
                      right = 25;
                      floatingActionIcon = Icons.message;
                    } else if (value == 2) {
                      button = 90;
                      right = 25;

                      floatingActionIcon = Icons.camera_alt;
                    } else if (value == 3) {
                      button = 25;
                      right = 25;

                      floatingActionIcon = Icons.phone_enabled_outlined;
                    } else if (value == 0) {
                      button = 25;
                      right = -60;

                      floatingActionIcon = Icons.message;
                    }
                  });
                },
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: [
                  Container(
                    width: 30,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.camera_alt,
                    ),
                  ),
                  Container(
                      width: yourWidth,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "CHATS",
                      )),
                  Container(
                      width: yourWidth,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "STATUS",
                      )),
                  Container(
                      width: yourWidth,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "CALL",
                      ))
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            bottom: button,
            right: right + 10,
            child: SizedBox(
              width: 40,
              child: FloatingActionButton(
                backgroundColor: Colors.grey[900],
                heroTag: 'pen',
                onPressed: () {},
                child: const Icon(Icons.edit),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            bottom: 25,
            right: right,
            child: SizedBox(
              width: 60,
              child: FloatingActionButton(
                backgroundColor: _color,
                heroTag: 'camera',
                onPressed: () {},
                child: Icon(
                  floatingActionIcon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
