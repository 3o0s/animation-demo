import 'package:flutter/material.dart';

class ExtendedButton extends StatefulWidget {
  const ExtendedButton({Key? key}) : super(key: key);

  @override
  State<ExtendedButton> createState() => _ExtendedButtonState();
}

class _ExtendedButtonState extends State<ExtendedButton> {
  bool ispoped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  margin: const EdgeInsets.all(18),
                  width: 300,
                  height: 300,
                ),
                AnimatedPositioned(
                  bottom: ispoped ? 80 : 0,
                  left: ispoped ? 60 : 120,
                  duration: Duration(milliseconds: 500),
                  child: UpperButtons(
                    radius: 30,
                    isPoped: ispoped,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 120,
                  child: RoundedButton(
                    onpressed: () {
                      setState(() {
                        ispoped = !ispoped;
                      });
                    },
                    radius: 30,
                    child: Icon(
                      ispoped
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up_outlined,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UpperButtons extends StatelessWidget {
  const UpperButtons({
    Key? key,
    this.color = Colors.white,
    this.isPoped = false,
    required this.radius,
  }) : super(key: key);
  final bool isPoped;

  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: isPoped ? radius * 6 : radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            left: isPoped ? 120 : 0,
            child: RoundedButton(
              color: color,
              onpressed: () {},
              radius: 30,
              child: const Icon(
                Icons.remove,
                size: 40,
              ),
            ),
          ),
          AnimatedPositioned(
            left: isPoped ? 60 : 0,
            duration: Duration(milliseconds: 500),
            child: RoundedButton(
              color: color,
              onpressed: () {},
              radius: 30,
              child: const Icon(
                Icons.arrow_circle_up_sharp,
                size: 40,
              ),
            ),
          ),
          AnimatedPositioned(
            left: 0,
            duration: Duration(milliseconds: 500),
            child: RoundedButton(
              color: color,
              onpressed: () {},
              radius: 30,
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({
    Key? key,
    required this.onpressed,
    required this.radius,
    required this.child,
    this.color = Colors.white,
  }) : super(key: key);
  final Function() onpressed;
  final double radius;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: IconButton(
        splashColor: Colors.black,
        splashRadius: radius,
        onPressed: onpressed,
        icon: child,
      ),
    );
  }
}
