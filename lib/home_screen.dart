import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double button = 25;
  IconData floatingActionIcon = Icons.message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    button = 25;
                    floatingActionIcon = Icons.message;
                  });
                },
                child: const Text('chat'),
              ),
              TextButton(
                onPressed: () {
                  if (button == 25) {
                    setState(() {
                      button = 90;
                      floatingActionIcon = Icons.camera_alt;
                    });
                  }
                },
                child: const Text('status'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    button = 25;
                    floatingActionIcon = Icons.phone;
                  });
                },
                child: const Text('calls'),
              ),
            ],
          ),
          SizedBox(
            height: 400,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  bottom: button,
                  right: 35,
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
                Positioned(
                  bottom: 25,
                  right: 25,
                  child: SizedBox(
                    width: 60,
                    child: FloatingActionButton(
                      backgroundColor: Colors.greenAccent,
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
          )
        ],
      ),
    );
  }
}
