import 'package:easy_router/route.dart';
import 'package:flutter/material.dart';

@EasyRoute(url: "easy://flutter/pageb")
class PageB extends StatefulWidget {
  final EasyRouteOption routeOption;
  PageB(this.routeOption);

  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageB"),
      ),
      body: Center(
        child: Text("PageB, params:${widget.routeOption.params.toString()}"),
      ),
    );
  }
}