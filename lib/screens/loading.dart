import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: Center(
        child: LoadingFlipping.circle(
          borderColor: Colors.green[50],
          borderSize: 3.0,
          size: 30.0,
          backgroundColor: Colors.grey[850],
          // duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}


//Widget for displaying loading animation and doing background work at the same time.
// class EzTransition extends StatefulWidget {
//   EzTransition(this.child, this.toProcess, {this.backgroundColor});
//
//   final Function() toProcess;
//   final Widget child;
//   final Color backgroundColor;
//
//   @override
//   _EzTransitionState createState() => _EzTransitionState();
// }
//
// class _EzTransitionState extends State<EzTransition> {
//   @override
//   void initState() {
//     super.initState();
//     widget.toProcess();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: getBackgroundColor(),
//       child: widget.child,
//     );
//   }
//
//   Color getBackgroundColor() {
//     return widget.backgroundColor == null
//         ? Theme.of(context).backgroundColor
//         : widget.backgroundColor;
//   }
// }