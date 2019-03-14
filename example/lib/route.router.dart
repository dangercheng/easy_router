import 'package:example/route.router.internal.dart';
import 'package:easy_router/route.dart';

@easyRouter
class Router {
    EasyRouterInternal internalImpl = EasyRouterInternalImpl();
    dynamic getPage(String url) {
      EasyRouteResult result = internalImpl.router(url);
      if(result.state == EasyRouterResultState.NOT_FOUND) {
        print("Router error: page not found");
        return null;
      }
      return result.widget;
    } 
}