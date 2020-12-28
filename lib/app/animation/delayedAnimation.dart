import 'package:flutter/material.dart';

class DelayedAnimation extends StatefulWidget {
  DelayedAnimation({@required this.child, this.delay=0});

  final Widget child;
  final int delay;
  @override
  _DelayedAnimationState createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animationOffset;
  bool disposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _controller);
    _animationOffset = Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero).animate(curve);

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (disposed) {
        return;
      }
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animationOffset,
        child: widget.child,
      ),
      opacity: _controller,
    );
  }

  @override
  void dispose() {
    disposed = true;
    _controller.dispose();
    super.dispose();
  }
}
