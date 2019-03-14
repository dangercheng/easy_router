import 'package:easy_router/src/route_parser.dart';
import 'package:easy_router/src/tpl.dart';
import 'package:mustache4dart/mustache4dart.dart';

class RouterWriter {
  final RouteParser routeParser;
  RouterWriter(this.routeParser);

  String createInstance() {
    final StringBuffer buffer =StringBuffer();
    buffer.writeln('switch (clazz) {');
    routeParser.routeMap.forEach((String path, dynamic type) {
      buffer.writeln('case $type: return $type(option);');
    });
    buffer..writeln('default:return null;')..writeln('}');
    return buffer.toString();
  }
  
  List<Map<String, String>> createImports() {
    final List<Map<String, String>> imports = <Map<String, String>>[];
    final Function addRef = (String path) {
      imports.add(<String, String>{'path': path});
    };
    routeParser.importList.forEach(addRef);
    return imports;
  }

  String write() {
    return render(routerTpl, <String, dynamic>{
      'imports': createImports(),
      'classInstance': createInstance(),
      'routeMap':routeParser.routeMap.toString()
    });
  }
}