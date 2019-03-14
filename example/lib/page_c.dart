import 'package:flutter/material.dart';
import 'package:easy_router/route.dart';

@EasyRoute(url: "easy://flutter/pagec")
class PageC extends StatefulWidget {
  final EasyRouteOption routeOption;
  PageC(this.routeOption);

  @override
  _PageCState createState() => _PageCState();
}

class _PageCState extends State<PageC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageC"),
      ),
      body: Center(
        child: Text("PageC Params:${widget.routeOption.params.toString()}"),
      ),
    );
  }
}