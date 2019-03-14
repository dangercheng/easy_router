///定义页面路由注解
class EasyRoute {
  final String url;
  final String desc;

  const EasyRoute({this.url, this.desc});
}

///定义路由解析器注解
class EasyRouter {
  const EasyRouter();
}

///路由参数选项
class EasyRouteOption {
  String url;
  Map<String, dynamic>params;

  EasyRouteOption({this.url, this.params});
}

///路由结果状态
///[FOUND]: 找到
///[NOT_FOUND]: 未找到
enum EasyRouterResultState {
  FOUND,
  NOT_FOUND
}

///路由结果
class EasyRouteResult {
  dynamic widget;
  EasyRouterResultState state;

  EasyRouteResult({this.widget, this.state});
}

///路由内部接口
abstract class EasyRouterInternal {
  EasyRouteResult router(String url);
}

const Object easyRouter = const EasyRouter();