import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class RouteParser {
  Map<String, dynamic> routeMap = {};
  List<String> importList = [];

  void parseRoute(ClassElement element, ConstantReader annotation, BuildStep buildStep) {
    print('start parseRoute for ${element.displayName}');
    String url = annotation.peek('url').stringValue;
    try {
      Uri uri =Uri.parse(url);
      if(uri.scheme != 'easy') {
        print('parse route error: bad scheme for $url');
        return;
      }
      if(uri.host != 'flutter') {
        print('parse route error: bad host for $url');
        return;
      }
      if(uri.path == null) {
        print('parse route error: bad path for $url');
        return;
      }
      String pathKey = "'" + uri.path + "'";
      if(routeMap[pathKey] != null) {
        print('parse route error: already exist for $url');
        return;
      }
      routeMap[pathKey] = element.displayName;
      if (buildStep.inputId.path.contains('lib/')) {
        print(buildStep.inputId.path);
        importList.add(
            "package:${buildStep.inputId.package}/${buildStep.inputId.path.replaceFirst('lib/', '')}");
      } else {
        importList.add("${buildStep.inputId.path}");
      }
    } catch (e) {
      print('parse route error $e');
    }
  }
}