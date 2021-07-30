import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyAnimated extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAnimatedState();
  }
}

class MyAnimatedState extends State<MyAnimated> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200 : 100,
          height: selected ? 100 : 200,
          color: selected ? Colors.red : Colors.blue,
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(
            size: 75,
          ),
        ),
      ),
    );
  }
}

class MyAnimated2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAnimated2State();
  }
}

class MyAnimated2State extends State<MyAnimated2>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          color: const Color(0xffffff),
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(60.0),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color(0x66666666),
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(0, 6.0))
          ]),
      end: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.zero));

  @override
  Widget build(BuildContext context) {
    // return AnimatedBuilder(
    //     animation: _controller,
    //     child: Container(
    //       width: 200,
    //       height: 200,
    //       color: Colors.green,
    //       child: Center(
    //         child: Text('Whee!'),
    //       ),
    //     ),
    //     builder: (BuildContext context, Widget child) {
    //       print('value: ${_controller.value}');
    //       return Transform.rotate(
    //         angle: _controller.value * 2.0 * math.pi,
    //         child: child,
    //       );
    //     });
    // return Container(
    //   color: Colors.white,
    //   child: Center(
    //     child: DecoratedBoxTransition(
    //       position: DecorationPosition.background,
    //       decoration: decorationTween.animate(_controller),
    //       child: Container(
    //         width: 200,
    //         height: 200,
    //         padding: EdgeInsets.all(10),
    //         child: FlutterLogo(),
    //       ),
    //     ),
    //   ),
    // );

    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: FlutterLogo(size: 100,),
        ),
      ),
    );
  }
}
