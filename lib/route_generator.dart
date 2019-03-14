import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:easy_router/src/route_parser.dart';
import 'package:easy_router/src/router_writer.dart';
import 'package:source_gen/source_gen.dart';

import 'route.dart';

///解析被EasyRoute注解标识的页面
class RouteParseGenerator extends GeneratorForAnnotation<EasyRoute> {
  static RouteParser routeParser = RouteParser();

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    routeParser.parseRoute(element, annotation, buildStep);
    return null;
  }
}

///生成Router逻辑
class RouterGenerator extends GeneratorForAnnotation<EasyRouter> {
  RouteParser routeParser() {
    return RouteParseGenerator.routeParser;
  }

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return RouterWriter(routeParser()).write();
  }
}