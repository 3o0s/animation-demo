import 'package:flutter/material.dart';

double offset = 0;
double bottom = 0;
bool firstTime = true;
late double width;
late double height;

class CustomDrower extends StatefulWidget {
  const CustomDrower({Key? key}) : super(key: key);

  @override
  State<CustomDrower> createState() => _CustomDrowerState();
}

class _CustomDrowerState extends State<CustomDrower> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (firstTime) {
      width = size.width;
      height = size.height;
      firstTime = false;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO:

          offset = offset == 0 ? -190 : 0;
          width = width == size.width ? 300 : size.width;
          height = height == size.height ? 600 : size.height;
          bottom = (size.height - height) / 2;
        },
        backgroundColor: Colors.amberAccent,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedPositioned(
            right: offset,
            bottom: bottom,
            duration: const Duration(milliseconds: 500),
            child: AnimatedContainer(
              width: width,
              height: height,
              duration: const Duration(
                milliseconds: 500,
              ),
              color: Colors.blueGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      offset = offset == 0 ? -190 : 0;
                      width = width == size.width ? 300 : size.width;
                      height = height == size.height ? 600 : size.height;
                      bottom = (size.height - height) / 2;
                      setState(() {});
                    },
                    child: Icon(
                      height == size.height
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_back_ios,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
