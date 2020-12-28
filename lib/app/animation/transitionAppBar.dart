import 'package:delivery_master/constant.dart';
import 'package:flutter/material.dart';

class TransitionAppBar extends StatelessWidget {
  final Widget avatar;
  final Widget title;
  final double extent;

  TransitionAppBar({this.avatar, this.title, this.extent = 250, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
          avatar: avatar,
          title: title,
          extent: extent > 200 ? extent : 200
      ),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  final _avatarMarginTween = EdgeInsetsTween(
      begin: EdgeInsets.only(bottom: 70, left: 30),
      end: EdgeInsets.only(left: 0.0, top: 30.0));
  final _avatarAlignTween =
  AlignmentTween(begin: Alignment.center, end: Alignment.topLeft);

  final Widget avatar;
  final Widget title;
  final double extent;

  _TransitionAppBarDelegate({this.avatar, this.title, this.extent = 250})
      : assert(avatar != null),
        assert(extent == null || extent >= 200),
        assert(title != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double op = 1 - (shrinkOffset * 2) / this.extent;
//    print(shrinkOffset / this.extent);
//    print(1- shrinkOffset / this.extent);
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: shrinkOffset,
          constraints: BoxConstraints(minHeight: maxExtent),
          color: lavender,
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//              begin: Alignment.centerRight,
//              end: Alignment.centerLeft,
//              colors: greenGradient,
//            ),
//          ),
        ),
        Center(
          child: Opacity(
            opacity: op < 0 ? 0 : op,
            child: avatar,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: title,
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => 150;

//  @override
//  double get minExtent => (maxExtent * 68) / 100;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar || title != oldDelegate.title;
  }
}