import 'package:easy_router/route.dart';
import 'package:flutter/material.dart';

@EasyRoute(url: "easy://flutter/pagea")
class PageA extends StatefulWidget {
  final EasyRouteOption routeOption;
  PageA(this.routeOption);

  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageA"),
      ),
      body: Center(
        child: Text("PageA"),
      ),
    );
  }
}